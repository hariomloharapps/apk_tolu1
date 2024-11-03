// android/app/src/main/kotlin/com/example/dekrf/MainActivity.kt
package com.example.tolu_7

import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import com.example.tolu_7.permissions.PermissionInitializer
import com.example.tolu_7.permissions.UsagePermissionHandler

class MainActivity : FlutterActivity() {
    private lateinit var permissionInitializer: PermissionInitializer

    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)

        // Initialize permissions
        permissionInitializer = PermissionInitializer(this, flutterEngine)
        permissionInitializer.initialize()
    }
}
