package com.example.open_study_app

import android.app.PendingIntent
import android.content.Context
import android.content.Intent
import android.content.pm.PackageInstaller
import android.net.ConnectivityManager
import android.net.Uri
import android.os.Build
import android.provider.Settings
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel
import java.io.File

/**
 * Hosts the Flutter UI and the "open_study/updater" channel, which installs a
 * downloaded update of this same app. On Android 12+ the install asks for no
 * confirmation once the user has allowed "Install unknown apps" for Open
 * Study; on older versions Android shows its usual Install prompt.
 */
class MainActivity : FlutterActivity() {
    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)
        MethodChannel(flutterEngine.dartExecutor.binaryMessenger, CHANNEL).setMethodCallHandler { call, result ->
            try {
                when (call.method) {
                    "sdkInt" -> result.success(Build.VERSION.SDK_INT)
                    "cacheDir" -> result.success(cacheDir.absolutePath)
                    "isMetered" -> {
                        val cm = getSystemService(Context.CONNECTIVITY_SERVICE) as ConnectivityManager
                        result.success(cm.isActiveNetworkMetered)
                    }
                    "canInstall" -> result.success(packageManager.canRequestPackageInstalls())
                    "openInstallSettings" -> {
                        startActivity(
                            Intent(Settings.ACTION_MANAGE_UNKNOWN_APP_SOURCES, Uri.parse("package:$packageName"))
                        )
                        result.success(null)
                    }
                    "install" -> {
                        val path = call.argument<String>("path")!!
                        val silent = call.argument<Boolean>("silent") ?: true
                        install(File(path), silent)
                        result.success(null)
                    }
                    // What happened to the last install attempt, then forget it:
                    // null, "needs_confirmation" or "failed: <message>".
                    "takeInstallOutcome" -> {
                        val prefs = getSharedPreferences(PREFS, Context.MODE_PRIVATE)
                        val outcome = prefs.getString(KEY_OUTCOME, null)
                        prefs.edit().remove(KEY_OUTCOME).apply()
                        result.success(outcome)
                    }
                    else -> result.notImplemented()
                }
            } catch (e: Exception) {
                result.error("updater", e.message, null)
            }
        }
    }

    override fun onResume() {
        super.onResume()
        visible = this
    }

    override fun onPause() {
        if (visible === this) visible = null
        super.onPause()
    }

    private fun install(apk: File, silent: Boolean) {
        val installer = packageManager.packageInstaller
        val params = PackageInstaller.SessionParams(PackageInstaller.SessionParams.MODE_FULL_INSTALL)
        params.setAppPackageName(packageName)
        if (silent && Build.VERSION.SDK_INT >= Build.VERSION_CODES.S) {
            params.setRequireUserAction(PackageInstaller.SessionParams.USER_ACTION_NOT_REQUIRED)
        }
        val sessionId = installer.createSession(params)
        installer.openSession(sessionId).use { session ->
            session.openWrite("update.apk", 0, apk.length()).use { out ->
                apk.inputStream().use { it.copyTo(out) }
                session.fsync(out)
            }
            val intent = Intent(this, UpdateInstallReceiver::class.java)
            val flags = PendingIntent.FLAG_UPDATE_CURRENT or
                (if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.S) PendingIntent.FLAG_MUTABLE else 0)
            val pending = PendingIntent.getBroadcast(this, sessionId, intent, flags)
            session.commit(pending.intentSender)
        }
    }

    companion object {
        const val CHANNEL = "open_study/updater"
        const val PREFS = "open_study_updater"
        const val KEY_OUTCOME = "install_outcome"

        /** The activity while it is on screen, so a confirmation can be shown. */
        var visible: MainActivity? = null
    }
}
