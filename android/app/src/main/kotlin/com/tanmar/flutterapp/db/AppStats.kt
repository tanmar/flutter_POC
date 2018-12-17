package com.tanmar.flutterapp.db

import android.arch.persistence.room.ColumnInfo
import android.arch.persistence.room.Entity
import android.arch.persistence.room.PrimaryKey


@Entity(tableName = "apps")
data class AppStats(@PrimaryKey @ColumnInfo(name = "id") val id: Int,
               val name: String,
               val timeInUsing: Int
)
