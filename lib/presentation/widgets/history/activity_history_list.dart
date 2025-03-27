import 'package:flutter/material.dart';
import 'package:intl/intl.dart'; // DateFormatを使用するためにインポート

// アクティビティのデータを格納するクラス
class Activity {
  final String distance;
  final String time;
  final DateTime dateTime;
  final String imagePath; // 画像パスを追加

  Activity({
    required this.distance,
    required this.time,
    required this.dateTime,
    required this.imagePath, // 画像パスもコンストラクタで受け取る
  });
}

class ActivityHistoryList extends StatelessWidget {
  const ActivityHistoryList({super.key});

  @override
  Widget build(BuildContext context) {
    // アクティビティデータのリスト
    final List<Activity> activities = [
      Activity(
        distance: "0.5km",
        time: "00:05:00",
        dateTime: DateTime(2025, 3, 25, 9, 30), // 日付と時間を指定
        imagePath: 'assets/images/ehho_walking.png',
      ),
      Activity(
        distance: "2.0km",
        time: "00:25:00",
        dateTime: DateTime(2025, 3, 26, 10, 45),
        imagePath: 'assets/images/ehho_running.png',
      ),
      Activity(
        distance: "1.5km",
        time: "00:18:00",
        dateTime: DateTime(2025, 3, 27, 8, 15),
        imagePath: 'assets/images/ehho_cycling.png',
      ),
      // 他のアクティビティデータを追加
    ];

    return SizedBox(
      height: 300, // 最大高さを設定（調整可能）
      child: Scrollbar(
        // スクロールバー表示（オプション）
        child: SingleChildScrollView(
          child: ConstrainedBox(
            constraints: const BoxConstraints(
              maxHeight: 400, // スクロール可能な最大高さ
            ),
            child: ListView.separated(
              shrinkWrap: true, // 内部でスクロールを管理
              physics: const AlwaysScrollableScrollPhysics(), // 必ずスクロール可能にする
              itemCount: activities.length, // データ数で管理
              separatorBuilder: (_, __) => const Divider(),
              itemBuilder: (context, index) {
                final activity = activities[index];
                final formattedDate = DateFormat(
                  'yyyy-MM-dd HH:mm',
                ).format(activity.dateTime); // 日時をフォーマット

                // 時間帯による条件分岐
                String timeOfDayStatus;
                IconData icon;
                timeOfDayStatus = formattedDate;
                if (activity.dateTime.hour >= 6 && activity.dateTime.hour < 9) {
                  // 朝
                  icon = Icons.wb_sunny;
                } else if (activity.dateTime.hour >= 9 &&
                    activity.dateTime.hour < 18) {
                  // 昼
                  icon = Icons.access_time;
                } else {
                  // 夜
                  icon = Icons.nights_stay;
                }

                return ListTile(
                  leading: Image.asset(
                    activity.imagePath, // 各アクティビティの画像を表示
                    width: 80,
                    height: 80,
                    fit: BoxFit.contain,
                  ),
                  title: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            activity.distance,
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                          Text(
                            activity.time,
                            style: const TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      Column(children: [Icon(icon), Text(timeOfDayStatus)]),
                    ],
                  ),
                  onTap: () {
                    // 詳細画面へ遷移（今は未実装）
                  },
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
