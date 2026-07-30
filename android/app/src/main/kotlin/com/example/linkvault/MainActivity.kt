package com.example.linkvault

import android.content.Intent
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel

class MainActivity : FlutterActivity() {
    private val channelName = "linkvault/share_intake"
    private var channel: MethodChannel? = null
    private var pendingSharedUrl: String? = null

    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)
        pendingSharedUrl = extractSharedUrl(intent) ?: pendingSharedUrl
        channel = MethodChannel(
            flutterEngine.dartExecutor.binaryMessenger,
            channelName,
        ).also { methodChannel ->
            methodChannel.setMethodCallHandler { call, result ->
                if (call.method == "takeSharedUrl") {
                    result.success(pendingSharedUrl)
                    pendingSharedUrl = null
                } else {
                    result.notImplemented()
                }
            }
        }
    }

    override fun onNewIntent(intent: Intent) {
        super.onNewIntent(intent)
        setIntent(intent)
        val sharedUrl = extractSharedUrl(intent) ?: return
        pendingSharedUrl = sharedUrl
        channel?.invokeMethod("sharedUrl", sharedUrl)
    }

    private fun extractSharedUrl(intent: Intent?): String? {
        if (intent?.action != Intent.ACTION_SEND || intent.type != "text/plain") {
            return null
        }
        val text = intent.getStringExtra(Intent.EXTRA_TEXT)?.trim().orEmpty()
        return urlPattern.find(text)?.value
    }

    companion object {
        private val urlPattern = Regex("""https?://[^\s]+""")
    }
}
