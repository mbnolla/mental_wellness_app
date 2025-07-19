plugins {
    id("com.android.application")
    kotlin("android")
    id("dev.flutter.flutter-gradle-plugin") // Flutter plugin
    id("com.google.gms.google-services")  // Firebase Google Services plugin
}

android {
    namespace = "com.nolla.mental_wellness_app"  // Change from com.example to your package
    compileSdk = flutter.compileSdkVersion
    ndkVersion = "27.0.12077973"

    compileOptions {
        sourceCompatibility = JavaVersion.VERSION_11
        targetCompatibility = JavaVersion.VERSION_11
    }

    kotlinOptions {
        jvmTarget = JavaVersion.VERSION_11.toString()
    }

    defaultConfig {
        applicationId = "com.nolla.mental_wellness_app" // Your package name here
        minSdk = flutter.minSdkVersion
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
