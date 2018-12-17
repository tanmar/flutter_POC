package com.tanmar.flutterapp.db

import android.arch.persistence.room.Database
import android.arch.persistence.room.Room
import android.arch.persistence.room.RoomDatabase
import android.content.Context


@Database(entities = [AppStats::class], version = 1, exportSchema = false)
abstract class AppDatabase : RoomDatabase() {
  abstract fun appsStatsDao(): AppsStatsDao

  companion object {
    @Volatile
    private var instance: AppDatabase? = null

    fun getInstance(context: Context): AppDatabase {
      return instance ?: synchronized(this) {
        instance ?: buildDatabase(context).also { instance = it }
      }
    }

    fun buildDatabase(context: Context): AppDatabase {
      val db =  Room.databaseBuilder(context, AppDatabase::class.java, DATABASE_NAME)
        .build()
      return db
    }
  }
}
