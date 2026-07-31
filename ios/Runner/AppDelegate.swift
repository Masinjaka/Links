import Flutter
import UIKit

@main
@objc class AppDelegate: FlutterAppDelegate, FlutterImplicitEngineDelegate {
  private let shareChannelName = "linkvault/share_intake"
  private let appGroupName = "group.com.masinjaka.rohy"
  private let sharedUrlKey = "pendingSharedUrl"
  private var shareChannel: FlutterMethodChannel?
  private var pendingSharedUrl: String?

  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }

  override func application(
    _ app: UIApplication,
    open url: URL,
    options: [UIApplication.OpenURLOptionsKey: Any] = [:]
  ) -> Bool {
    if url.scheme == "linkvault", let sharedUrl = sharedUrl(from: url) {
      publish(sharedUrl)
      return true
    }
    return super.application(app, open: url, options: options)
  }

  func didInitializeImplicitFlutterEngine(_ engineBridge: FlutterImplicitEngineBridge) {
    GeneratedPluginRegistrant.register(with: engineBridge.pluginRegistry)
    guard let registrar = engineBridge.pluginRegistry.registrar(
      forPlugin: "LinkVaultShareIntake"
    ) else {
      return
    }
    let channel = FlutterMethodChannel(
      name: shareChannelName,
      binaryMessenger: registrar.messenger()
    )
    channel.setMethodCallHandler { [weak self] call, result in
      guard call.method == "takeSharedUrl" else {
        result(FlutterMethodNotImplemented)
        return
      }
      result(self?.takePendingUrl())
    }
    shareChannel = channel
  }

  private func sharedUrl(from callback: URL) -> String? {
    let components = URLComponents(url: callback, resolvingAgainstBaseURL: false)
    return components?.queryItems?.first(where: { $0.name == "url" })?.value
  }

  private func publish(_ url: String) {
    pendingSharedUrl = url
    shareChannel?.invokeMethod("sharedUrl", arguments: url)
  }

  private func takePendingUrl() -> String? {
    if let pendingSharedUrl {
      self.pendingSharedUrl = nil
      return pendingSharedUrl
    }
    let defaults = UserDefaults(suiteName: appGroupName)
    let sharedUrl = defaults?.string(forKey: sharedUrlKey)
    defaults?.removeObject(forKey: sharedUrlKey)
    return sharedUrl
  }
}
