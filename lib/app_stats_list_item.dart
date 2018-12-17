import 'package:flutter/material.dart';
import 'package:flutter_app/app_stats_entity.dart';

class AppStatsListItem extends StatelessWidget {
  final AppStats appStats;

  const AppStatsListItem(this.appStats);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          appStats.name,
          style: Theme.of(context).textTheme.headline,
        ),
        const SizedBox(height: 8),
        Text(
          appStats.timeInUsing.toString(),
          style: Theme.of(context).textTheme.body1,
        )
      ],
    );
  }
}
