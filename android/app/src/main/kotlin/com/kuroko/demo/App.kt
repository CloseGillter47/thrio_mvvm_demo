package com.kuroko.demo

import android.app.Application
import com.hellobike.flutter.thrio.module.ThrioModule

class App : Application() {
    override fun onCreate() {
        super.onCreate()

        ThrioModule.init(this, FlutterModule)
    }
}