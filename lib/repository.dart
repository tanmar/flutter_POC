import 'package:flutter_app/app_stats_entity.dart';

abstract class AppStatsRepository {

  Future<List<AppStats>> loadAppStats();

}