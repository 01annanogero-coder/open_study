package com.example.open_study_app

import android.content.BroadcastReceiver
import android.content.Context
import android.content.Intent
import android.content.pm.PackageInstaller
import android.os.Build

/**
 * Receives the result of an update install started by [MainActivity].
 *
 * On success Android replaces the app; the new version runs at next launch.
 * If Android insists on a confirmation (older Android, or a silent install
 * was refused), the Install prompt is shown straight away when Open Study is
 * on screen; otherwise the outcome is saved and the app asks the user the
 * next time it is opened.
 */
class UpdateInstallReceiver : BroadcastReceiver() {
    override fun onReceive(context: Context, intent: Intent) {
        val status = intent.getIntExtra(PackageInstaller.EXTRA_STATUS, PackageInstaller.STATUS_FAILURE)
        val prefs = context.getSharedPreferences(MainActivity.PREFS, Context.MODE_PRIVATE)
        when (status) {
            PackageInstaller.STATUS_PENDING_USER_ACTION -> {
                val confirm = if (Build.VERSION.SDK_INT >= 33) {
                    intent.getParcelableExtra(Intent.EXTRA_INTENT, Intent::class.java)
                } else {
                    @Suppress("DEPRECATION")
                    intent.getParcelableExtra(Intent.EXTRA_INTENT)
                }
                val activity = MainActivity.visible
                if (confirm != null && activity != null) {
                    activity.startActivity(confirm)
                } else {
                    prefs.edit().putString(MainActivity.KEY_OUTCOME, "needs_confirmation").apply()
                }
            }
            PackageInstaller.STATUS_SUCCESS -> prefs.edit().remove(MainActivity.KEY_OUTCOME).apply()
            else -> {
                val message = intent.getStringExtra(PackageInstaller.EXTRA_STATUS_MESSAGE) ?: "status $status"
                prefs.edit().putString(MainActivity.KEY_OUTCOME, "failed: $message").apply()
            }
        }
    }
}
