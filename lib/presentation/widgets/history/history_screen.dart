import 'package:ehho/presentation/widgets/history/achievement_card.dart';
import 'package:ehho/presentation/widgets/history/activity_history_list.dart';
import 'package:ehho/presentation/widgets/history/exercise_mileage_bar.dart';
import 'package:flutter/material.dart';

class HistoryScreen extends StatelessWidget {
  const HistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppBar(leading: Icon(Icons.history), title: Text("アクティビティ履歴")),
              ActivityHistoryList(),
              SizedBox(height: 20),
              AppBar(leading: Icon(Icons.trending_up), title: Text("運動量")),
              ExerciseMileageBar(mileage: 5, maxMileage: 10),
              SizedBox(height: 20),
              AppBar(leading: Icon(Icons.archive), title: Text("実績")),
              AchievementRow(),
            ],
          ),
        ),
      ),
    );
  }
}
