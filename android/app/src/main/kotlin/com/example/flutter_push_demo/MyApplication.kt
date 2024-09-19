package com.example.flutter_push_demo

import com.moengage.core.DataCenter
import com.moengage.core.LogLevel
import com.moengage.core.MoEngage
import com.moengage.core.config.LogConfig
import com.moengage.core.config.NotificationConfig
import com.moengage.flutter.MoEInitializer
import io.flutter.app.FlutterApplication

class MyApplication : FlutterApplication() {

    override fun onCreate() {
        super.onCreate()
        val moEngage: MoEngage.Builder =
            MoEngage.Builder(this, "Z1UDNSWJALFR3UTPWWMCSF5Z", DataCenter.DATA_CENTER_1)
                .configureNotificationMetaData(
                    NotificationConfig(
                        R.drawable.launch_background,
                        R.drawable.launch_background,
                    )
                ).configureLogs(LogConfig(LogLevel.VERBOSE, true))
        MoEInitializer.initialiseDefaultInstance(applicationContext, moEngage)
    }

}