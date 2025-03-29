import 'package:ehho/presentation/widgets/history/achievement_card.dart';
import 'package:ehho/presentation/widgets/history/activity_history_list.dart';
import 'package:ehho/presentation/widgets/history/exercise_mileage_bar.dart';
import 'package:flutter/material.dart';
import 'package:ehho/core/models/activity.dart' as core;

class HistoryScreen extends StatelessWidget {
  final List<core.Activity> activities;
  const HistoryScreen({super.key, required this.activities});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            AppBar(
              leading: Icon(Icons.history), // 左側のアイコン
              title: Text("アクティビティ履歴"),
            ),
            ActivityHistoryList(),
            SizedBox(height: 20),
            AppBar(
              leading: Icon(Icons.trending_up), // 左側のアイコン
              title: Text("運動量"),
            ),

            ExerciseMileageBar(mileage: 5, maxMileage: 10),
            AppBar(
              leading: Icon(Icons.archive), // 左側のアイコン
              title: Text("実績"),
            ),
            AchievementRow(),
          ],
        ),
      ),
    );
  }
}
