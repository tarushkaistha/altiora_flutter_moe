package com.example.flutter_push_demo

import android.app.Activity
import android.content.Intent
import android.os.Bundle
import android.util.Log
import androidx.core.content.ContextCompat.startActivity
import com.moengage.core.model.AccountMeta
import com.moengage.plugin.base.push.PluginPushCallback
import com.moengage.pushbase.NAVIGATION_TYPE_RICH_LANDING
import com.moengage.pushbase.NAV_ACTION
import com.moengage.pushbase.model.action.NavigationAction

class MyPluginPushCallback : PluginPushCallback(AccountMeta("Z1UDNSWJALFR3UTPWWMCSF5Z")) {


    override fun onNotificationClick(activity: Activity, payload: Bundle): Boolean {

        val url_value = payload.getString("url")
        Log.d("cmpl", "gcm url: $url_value")
//        if (isRichLandingPush(payload)) {
//            val intent = Intent(activity, CustomWebView::class.java)
//            intent.putExtra("url", url_value)
//            Log.d("cmpl intent", "gcm url set intent extra: $url_value")
//            startActivity(activity, intent, null)
//            return true
//
//        }

        val intent = Intent(activity, CustomWebView::class.java)
        intent.putExtra("url", url_value)
        Log.d("cmpl intent", "gcm url set intent extra: $url_value")
        startActivity(activity, intent, null)
        return super.onNotificationClick(activity, payload)
    }

    private fun isRichLandingPush(payload: Bundle): Boolean {
        val navigationAction = payload.getParcelable(NAV_ACTION) as? NavigationAction?
        val isRichLandingPushAction =
            navigationAction?.navigationType == NAVIGATION_TYPE_RICH_LANDING
//        val richLandingUrl = payload.getString(PUSH_NOTIFICATION_NAVIGATION_DEEPLINK_LEGACY, "")
        return isRichLandingPushAction
    }
}
