package com.example.full_screen_notification

import android.app.Activity
import android.app.KeyguardManager
import android.content.Context
import android.content.Intent
import android.os.Build
import android.os.Bundle
import android.widget.Button
import android.widget.TextView
import androidx.annotation.RequiresApi
import io.flutter.embedding.android.FlutterActivity

class NotificationActivity : FlutterActivity() {
    @RequiresApi(Build.VERSION_CODES.LOLLIPOP_MR1)
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)

        setContentView(R.layout.activity_notification)
        turnScreenOnAndKeyguardOff()


        val message = intent.getStringExtra("message")
        val textView = findViewById<TextView>(R.id.payloadmsg)
        textView.text = message

        val button = findViewById<Button>(R.id.btn)

        button.setOnClickListener {

            navigateToMainActivity()

        }


    }

    @RequiresApi(Build.VERSION_CODES.LOLLIPOP_MR1)
    override fun onBackPressed() {
        super.onBackPressed()
        val keyguardManager = getSystemService(Context.KEYGUARD_SERVICE) as KeyguardManager

        if (keyguardManager.isDeviceLocked){
            finish()
        }
        else{
            navigateToMainActivity()
        }

    }
    private fun navigateToMainActivity(){
        val intent = Intent(this, MainActivity::class.java)
        intent.flags = Intent.FLAG_ACTIVITY_NEW_TASK or Intent.FLAG_ACTIVITY_CLEAR_TASK
        turnScreenOffAndKeyguardOn()
        startActivity(intent)
        finish()
    }

    companion object {
        const val REQUEST_PIN_OR_PASSWORD = 1001
    }



}