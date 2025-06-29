plugins {
    id("com.android.application")
    id("kotlin-android")
    id("dev.flutter.flutter-gradle-plugin")
}

android {
    ndkVersion = "27.0.12077973" // Optional, remove if not needed
    namespace = "com.example.app1"
    compileSdk = flutter.compileSdkVersion

    compileOptions {
        sourceCompatibility = JavaVersion.VERSION_11
        targetCompatibility = JavaVersion.VERSION_11
    }

    kotlin {
        jvmToolchain(11) // Explicitly use Java 11 toolchain for Kotlin
    }

    defaultConfig {
        applicationId = "com.example.app1"
        minSdk = 21 // Compatible with google_maps_flutter and google_maps_place_picker_mb
        targetSdk = flutter.targetSdkVersion
        versionCode = flutter.versionCode
        versionName = flutter.versionName
    }

    buildTypes {
        release {
            signingConfig = signingConfigs.getByName("debug")
        }
    }
}

flutter {
    source = "../.."
}

dependencies {
    // Ensure consistent Kotlin version if needed
    implementation("org.jetbrains.kotlin:kotlin-stdlib:1.9.22") // Use a version compatible with your setup
}
