package com.kuroko.demo

import android.app.Activity
import com.hellobike.flutter.thrio.navigator.FlutterIntentBuilder

object FlutterActivityIntentBuilder : FlutterIntentBuilder() {
    override fun getActivityClz(): Class<out Activity> = FlutterActivity::class.java
}