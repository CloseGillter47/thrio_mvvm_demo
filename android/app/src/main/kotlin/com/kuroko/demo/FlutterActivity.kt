package com.kuroko.demo

import com.hellobike.flutter.thrio.channel.ThrioChannel
import com.hellobike.flutter.thrio.navigator.FlutterEngineFactory
import com.hellobike.flutter.thrio.navigator.getEntrypoint
import io.flutter.Log

import io.flutter.embedding.android.ThrioActivity
import io.flutter.embedding.engine.FlutterEngine
import java.util.*
import kotlin.concurrent.timerTask

class FlutterActivity : ThrioActivity() {
    private var channel: ThrioChannel? = null

    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)
        FlutterEngineFactory.getEngine(intent.getEntrypoint())?.let {
            channel = ThrioChannel(intent.getEntrypoint(), "__exhibition__")
            channel?.setupMethodChannel(it.flutterEngine.dartExecutor)
        }
    }

//    override fun onBackPressed() {
//        super.onBackPressed()
//        FlutterEngineFactory.getEngine(intent.getEntrypoint())?.flutterEngine?.navigationChannel?.popRoute();
//    }

    override fun onResume() {
        super.onResume()
        Timer().schedule(timerTask {
            runOnUiThread {
                channel?.invokeMethod("sayHello")
            }
        }, 500)
    }
}