package com.example.full_screen_notification

import android.content.Intent
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel

class MainActivity: FlutterActivity() {

    private val CHANNEL = "com.example.app/example"


    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        turnScreenOffAndKeyguardOn()
        super.configureFlutterEngine(flutterEngine)
        cachedFlutterEngine = flutterEngine
        MethodChannel(flutterEngine.dartExecutor.binaryMessenger, CHANNEL).setMethodCallHandler {
                call, result ->

            if (call.method == "sendData") {
                val value =(call.arguments as Map<*, *>);
                navigate(value["data"].toString())
            } else {
                result.notImplemented()
            }

        }
    }

    private fun navigate(payloadMsg:String):Unit {
        var intent: Intent? = null;
        intent = Intent(this,NotificationActivity::class.java)
        intent.putExtra("message", payloadMsg)
        startActivity(intent)
        finish()

    }




    companion object {
        var cachedFlutterEngine: FlutterEngine? = null
        fun createMethodChannel(
            channelId: String
        ): MethodChannel? {

            return cachedFlutterEngine?.let {
                cachedFlutterEngine?.dartExecutor?.let { it1 ->
                    MethodChannel(
                        it1,
                        channelId
                    )
                }
            }
        }

    }
}
