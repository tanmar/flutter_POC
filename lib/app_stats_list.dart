import 'package:flutter/material.dart';
import 'package:flutter_app/app_stats_entity.dart';
import 'package:flutter_app/no_content.dart';
import 'package:flutter_app/app_stats_list_item.dart';

class AppStatsList extends StatelessWidget {
  const AppStatsList(this.list);

  final Stream<List<AppStats>> list;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<AppStats>>(
        stream: list,
        builder:
            (BuildContext context, AsyncSnapshot<List<AppStats>> snapshot) {
          if (snapshot.hasError) {
            return Text("Error ${snapshot.error}");
          }

          switch (snapshot.connectionState) {
            case ConnectionState.waiting:
              return const Text("Loading...");
            default:
              if (snapshot.data.isEmpty) {
                return const NoContent();
              }
              return _itemList(snapshot.data);
          }
        });
  }

  ListView _itemList(List<AppStats> list) {
    return ListView(
      children: list.map((AppStats appStats) {
        return Container(
          padding: const EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 8.0),
          child: AppStatsListItem(appStats),
        );
      }).toList(),
    );
  }
}
