package com.tanmar.flutterapp

import android.os.Bundle
import com.tanmar.flutterapp.db.AppDatabase
import com.tanmar.flutterapp.db.AppStats

import io.flutter.app.FlutterActivity
import io.flutter.plugins.GeneratedPluginRegistrant
import kotlinx.coroutines.*

class MainActivity : FlutterActivity() {

    private val db by lazy { AppDatabase.getInstance(this) }
    private val viewModelJob = Job()

    private val uiScope = CoroutineScope(Dispatchers.Main + viewModelJob)

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        GeneratedPluginRegistrant.registerWith(this)
        uiScope.launch {
            test()
        }
    }

    suspend fun test(): Long? {
        withContext(Dispatchers.IO) {
            db.appsStatsDao().insert(AppStats(1, "myapp1", 100))
        }
        return 1
    }
}
