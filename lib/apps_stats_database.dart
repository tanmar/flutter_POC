import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';
import 'app_stats_entity.dart';
import 'dart:io';

final String tableApps = "apps";
final String columnId = "id";
final String columnAppName = "app_name";
final String columnUsedTime = "used_time";


class AppsStatsDatabase {
  static final AppsStatsDatabase _appsStatsDatabase =
      AppsStatsDatabase._internal();



  Database _db;
  bool didInit = false;

  static AppsStatsDatabase get() => _appsStatsDatabase;

  AppsStatsDatabase._internal();

  Future<Database> _getDb() async{
    if(!didInit) await init();
    return _db;
  }


  Future init() async {
    return await _init();
  }

  Future _init() async {
//    Directory databasesPath = await getApplicationDocumentsDirectory();
    var databasesPath = await getDatabasesPath();
    String path = join(databasesPath, 'apps-db');
    _db = await openDatabase(path, version: 1,
        onCreate: (Database db, int version) async {
          // We dont need create db here
        });
//    String tempPath = databasesPath.path;
  }

  Future<List<AppStats>> getAppStats() async{
    var db = await _getDb();
    var result = await db.rawQuery('SELECT * FROM $tableApps');
    print("tttt " + result.toString());
    if(result.length == 0)return null;
    return List<AppStats>();
  }

}
