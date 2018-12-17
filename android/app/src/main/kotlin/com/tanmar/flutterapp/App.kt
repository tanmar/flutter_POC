package com.tanmar.flutterapp

import com.facebook.stetho.Stetho
import io.flutter.app.FlutterApplication

class App : FlutterApplication() {
  override fun onCreate() {
    super.onCreate()
    Stetho.initializeWithDefaults(this)
  }
}
