import 'package:ehho/presentation/widgets/history/activity_history_list.dart';
import 'package:ehho/presentation/widgets/history/mileage_bar.dart';
import 'package:flutter/material.dart';
// import 'package:go_router/go_router.dart';

class HistoryScreen extends StatelessWidget {
  const HistoryScreen({super.key});

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
            MileageBar(mileage: 5, maxMileage: 10),
          ],
        ),
      ),
    );
  }
}
