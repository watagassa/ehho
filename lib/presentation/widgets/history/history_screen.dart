<<<<<<< HEAD
import 'package:ehho/presentation/widgets/history/achievement_card.dart';
import 'package:ehho/presentation/widgets/history/activity_history_list.dart';
import 'package:ehho/presentation/widgets/history/exercise_mileage_bar.dart';
=======
// import 'package:ehho/presentation/screens/home/home_screen.dart';
>>>>>>> Uchida_map_02
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
<<<<<<< HEAD
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
=======
          children: [  
            Row(
              children: [
                const Icon(Icons.history),
                Title(
                  color: Colors.black, 
                  child: Text("アクティビティ履歴", 
                  style: TextStyle(
                    fontSize: 24, 
                    fontWeight: FontWeight.bold),
                  )
                )
              ],
            ), 
            Expanded(
              child: ListView.separated(
                itemCount: 3, // 仮データ数
                separatorBuilder: (_, __) => const Divider(),
                itemBuilder: (context, index) {
                  return ListTile(
                    leading: const Icon(Icons.history),
                    title: Text(
                      "2025-03-${index + 10}"
                    ),
                    subtitle: Text(
                      "運動時間: ${(index + 1) * 10}分  |  距離: ${(index + 1) * 1.5} km",
                    ),
                    trailing: const Icon(Icons.arrow_forward_ios),
                    onTap: () {
                      // 詳細画面へ遷移（今は未実装）
                    },
                  );
                },
              ),
            ),
            Row(
              children: [
                const Icon(Icons.nordic_walking),
                Title(
                  color: Colors.black, 
                  child: Text("運動量", 
                  style: TextStyle(
                    fontSize: 24, 
                    fontWeight: FontWeight.bold),
                  )
                )
              ],
            ),
            Row(
              children: [
                const Icon(Icons.archive),
                Title(
                  color: Colors.black, 
                  child: Text("実績", 
                  style: TextStyle(
                    fontSize: 24, 
                    fontWeight: FontWeight.bold),
                  )
                )
              ],
            ),
>>>>>>> Uchida_map_02
          ],
        ),
      ),
    );
  }
}
