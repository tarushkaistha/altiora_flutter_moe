package com.example.flutter_push_demo

import android.os.Bundle
import android.util.Log
import android.webkit.WebView
import android.webkit.WebViewClient
import androidx.appcompat.app.AppCompatActivity
import com.example.flutter_push_demo.databinding.ActivityCustomWebViewBinding
import com.moengage.core.internal.global.GlobalCache

class CustomWebView : AppCompatActivity() {

    private lateinit var binding: ActivityCustomWebViewBinding

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)

        binding = ActivityCustomWebViewBinding.inflate(layoutInflater)
        setContentView(binding.root)


        setSupportActionBar(binding.toolbar)
        supportActionBar?.setDisplayHomeAsUpEnabled(true);
        supportActionBar?.setDisplayShowHomeEnabled(true);

        binding.toolbar.setNavigationOnClickListener {
            onBackPressed()
        }
        var articleUrl = String()
        try {
            articleUrl = intent.getStringExtra("url").toString()
            Log.d("cwv", "my article url: $articleUrl")
            val webView: WebView = binding.myWebView
            webView.settings.javaScriptEnabled = GlobalCache.jsConfig.isJavaScriptEnabled
            webView.settings.builtInZoomControls = true
            webView.settings.domStorageEnabled = true
            webView.webViewClient = WebViewClient()
            webView.loadUrl(articleUrl)
        } catch (t: Throwable) {
            Log.d("moengage web", "onCreate:  ")
            Log.d("moengage web", "onCreate: could not load web view ")
            finish()
        }

    }
}