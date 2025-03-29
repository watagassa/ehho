import java.util.Properties
import java.io.FileInputStream

plugins {
    id("com.android.application")
    id("kotlin-android")
    id("dev.flutter.flutter-gradle-plugin")
}

// dotenvをロード
val dotenv = Properties().apply {
    val dotenvFile = rootProject.file("../.env")  // 相対パスで再確認
    println("Looking for .env file at: ${dotenvFile.absolutePath}")
    if (dotenvFile.exists()) {
        load(FileInputStream(dotenvFile))  // .envファイルが存在すれば読み込む
    } else {
        println(".env ファイルが見つかりません")  // .envファイルがない場合のメッセージ
    }
}

android {
    namespace = "com.example.ehho"
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
        applicationId = "com.example.ehho"
        minSdk = 21
        targetSdk = flutter.targetSdkVersion
        versionCode = flutter.versionCode
        versionName = flutter.versionName
        manifestPlaceholders["GOOGLE_MAP_API_KEY"] = dotenv.getProperty("GOOGLE_MAP_API_KEY") ?: ""



    }
    // 基本は初期設定を使うが、envに書いてあったらそっちのkeystore設定を使用
    signingConfigs {
        getByName("debug") {
            storeFile = file(dotenv.getProperty("MY_KEYSTORE_PATH") ?: rootProject.file("debug.keystore"))
            storePassword = dotenv.getProperty("MY_KEYSTORE_PASSWORD") ?: "android"
            keyAlias = dotenv.getProperty("MY_KEY_ALIAS") ?: "androiddebugkey"
            keyPassword = dotenv.getProperty("MY_KEY_PASSWORD") ?: "android"
        }
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
