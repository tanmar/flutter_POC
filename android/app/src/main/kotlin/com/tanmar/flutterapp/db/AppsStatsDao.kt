package com.tanmar.flutterapp.db

import android.arch.persistence.room.Dao
import android.arch.persistence.room.Insert
import android.arch.persistence.room.OnConflictStrategy
import android.arch.persistence.room.Query


@Dao
interface AppsStatsDao {
  @Query("select * from apps")
  fun getAppsStats(): List<AppStats>

  @Insert(onConflict = OnConflictStrategy.REPLACE)
  fun insert(plants: AppStats) : Long

}
