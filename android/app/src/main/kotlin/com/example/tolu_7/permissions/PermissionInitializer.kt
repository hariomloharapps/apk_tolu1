
// android/app/src/main/kotlin/com/example/dekrf/permissions/PermissionInitializer.kt
package com.example.tolu_7.permissions

import android.content.Context
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel

class PermissionInitializer(
    private val context: Context,
    private val flutterEngine: FlutterEngine
) {
    companion object {
        const val CHANNEL_NAME = "com.example.dekrf/usage_permission"
    }

    fun initialize() {
        val usagePermissionHandler = UsagePermissionHandler(context)

        MethodChannel(flutterEngine.dartExecutor.binaryMessenger, CHANNEL_NAME)
            .setMethodCallHandler { call, result ->
                when (call.method) {
                    "checkPermission" -> {
                        result.success(usagePermissionHandler.checkPermission())
                    }
                    "requestPermission" -> {
                        try {
                            usagePermissionHandler.requestPermission()
                            result.success(true)
                        } catch (e: Exception) {
                            result.error("PERMISSION_ERROR", e.message, null)
                        }
                    }
                    else -> result.notImplemented()
                }
            }
    }
}
