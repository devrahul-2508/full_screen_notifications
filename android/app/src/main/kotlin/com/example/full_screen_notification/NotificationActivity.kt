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
            val keyguardManager = getSystemService(Context.KEYGUARD_SERVICE) as KeyguardManager

            if (keyguardManager.isDeviceLocked){
                if (keyguardManager.isKeyguardSecure) {

                    val intent = keyguardManager.createConfirmDeviceCredentialIntent(null, null);
                    startActivityForResult(intent, REQUEST_PIN_OR_PASSWORD)


                } else {
                    // Device is not locked, start the activity directly
                    navigateToMainActivity()
                }
            }
            else{
                navigateToMainActivity()
            }

        }


    }

    override fun onActivityResult(requestCode: Int, resultCode: Int, data: Intent?) {
        super.onActivityResult(requestCode, resultCode, data)
        if (requestCode == REQUEST_PIN_OR_PASSWORD) {
            if (resultCode == Activity.RESULT_OK) {
                // User entered correct PIN or password, start the activity
              navigateToMainActivity()
            } else {
                // User canceled or entered incorrect PIN or password
                // Handle accordingly, for example, show a message or exit the app
            }
        }
    }

    override fun onBackPressed() {
        super.onBackPressed()
        navigateToMainActivity()
    }
    private fun navigateToMainActivity(){
        val intent = Intent(this, MainActivity::class.java)
        startActivity(intent)
        finish()
    }

    companion object {
        const val REQUEST_PIN_OR_PASSWORD = 1001
    }



}