import 'package:flutter_app/app_stats_entity.dart';
import 'package:flutter_app/apps_stats_database.dart';
import 'package:flutter_app/repository.dart';

class AppStatsRepositoryImpl implements AppStatsRepository {
  AppsStatsDatabase database;
  static final AppStatsRepositoryImpl _repo =
      new AppStatsRepositoryImpl._internal();

  static AppStatsRepositoryImpl get() {
    return _repo;
  }

  AppStatsRepositoryImpl._internal() {
    database = AppsStatsDatabase.get();
  }

  @override
  Future<List<AppStats>> loadAppStats() async {
    return database.getAppStats();
  }
}
