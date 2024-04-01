package com.example.full_screen_notification

import android.content.Intent
import android.os.Build
import android.os.Bundle
import android.view.WindowManager
import android.widget.Button
import android.widget.TextView
import androidx.activity.enableEdgeToEdge
import androidx.appcompat.app.AppCompatActivity
import androidx.core.view.ViewCompat
import androidx.core.view.WindowInsetsCompat
import io.flutter.embedding.android.FlutterActivity

class NotificationActivity : FlutterActivity() {
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)

        setContentView(R.layout.activity_notification)
        turnScreenOnAndKeyguardOff()


        val message = intent.getStringExtra("message")
        val textView = findViewById<TextView>(R.id.payloadmsg)
        textView.text = message

        val button = findViewById<Button>(R.id.btn)

        button.setOnClickListener {
            val intent = Intent(this, MainActivity::class.java)
            startActivity(intent)
            finish() // Finish the current activity so that it's not kept in the back stack
        }

    }

    override fun onBackPressed() {
        super.onBackPressed()
        // Start MainActivity when back button is pressed
        val intent = Intent(this, MainActivity::class.java)
        startActivity(intent)
        finish() // Finish the current activity so that it's not kept in the back stack
    }
}