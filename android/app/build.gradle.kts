import java.util.Properties

plugins {
    id("com.android.application")
    id("kotlin-android")
    // The Flutter Gradle Plugin must be applied after the Android and Kotlin Gradle plugins.
    id("dev.flutter.flutter-gradle-plugin")
}

val releaseSigningPropertiesFile = rootProject.file("key.properties")
val releaseSigningProperties = Properties().apply {
    if (releaseSigningPropertiesFile.isFile) {
        releaseSigningPropertiesFile.inputStream().use(::load)
    }
}
val releaseSigningKeys =
    listOf("storeFile", "storePassword", "keyAlias", "keyPassword")
val missingReleaseSigningKeys =
    releaseSigningKeys.filter { releaseSigningProperties.getProperty(it).isNullOrBlank() }
val releaseBuildRequested =
    gradle.startParameter.taskNames.any { it.contains("release", ignoreCase = true) }

if (releaseBuildRequested) {
    check(releaseSigningPropertiesFile.isFile) {
        "Release signing requires android/key.properties. " +
            "Copy android/key.properties.example and provide your upload key credentials."
    }
    check(missingReleaseSigningKeys.isEmpty()) {
        "Missing release signing properties: ${missingReleaseSigningKeys.joinToString()}."
    }
}

android {
    namespace = "com.masinjaka.rohy"
    compileSdk = flutter.compileSdkVersion
    ndkVersion = flutter.ndkVersion

    compileOptions {
        sourceCompatibility = JavaVersion.VERSION_17
        targetCompatibility = JavaVersion.VERSION_17
    }

    kotlinOptions {
        jvmTarget = JavaVersion.VERSION_17.toString()
    }

    defaultConfig {
        applicationId = "com.masinjaka.rohy"
        // You can update the following values to match your application needs.
        // For more information, see: https://flutter.dev/to/review-gradle-config.
        minSdk = flutter.minSdkVersion
        targetSdk = flutter.targetSdkVersion
        versionCode = flutter.versionCode
        versionName = flutter.versionName
    }

    signingConfigs {
        if (releaseSigningPropertiesFile.isFile && missingReleaseSigningKeys.isEmpty()) {
            create("release") {
                storeFile = rootProject.file(releaseSigningProperties.getProperty("storeFile"))
                storePassword = releaseSigningProperties.getProperty("storePassword")
                keyAlias = releaseSigningProperties.getProperty("keyAlias")
                keyPassword = releaseSigningProperties.getProperty("keyPassword")
            }
        }
    }

    buildTypes {
        release {
            signingConfig = signingConfigs.findByName("release")
        }
    }
}

flutter {
    source = "../.."
}
