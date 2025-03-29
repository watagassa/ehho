import 'package:ehho/core/models/activity.dart';
import 'package:ehho/core/models/testData.dart';
import 'package:ehho/core/utils/generate_history.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart'; // DateFormatを使用するためにインポート

// アクティビティのデータを格納するクラス
class ActivityHistoryList extends StatelessWidget {
  const ActivityHistoryList({super.key});

  @override
  Widget build(BuildContext context) {
    List<Activity> testActivitys = activityListTest;
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
              separatorBuilder: (_, __) => const Divider(),

              itemCount: testActivitys.length, // データ数で管理

              itemBuilder: (context, index) {
                final activity = testActivitys[index]; // 日時をフォーマット
                DateFormat dateFormat = DateFormat('yyyy-MM-dd HH:mm');
                DateTime formatteDateTime = dateFormat.parse(activity.day);
                // 時間帯による条件分岐

                IconData icon;
                if (formatteDateTime.hour >= 6 && formatteDateTime.hour < 9) {
                  // 朝
                  icon = Icons.wb_sunny;
                } else if (formatteDateTime.hour >= 9 &&
                    formatteDateTime.hour < 18) {
                  // 昼
                  icon = Icons.access_time;
                } else {
                  // 夜
                  icon = Icons.nights_stay;
                }

                String imagePath = generateImagePath(activity.activity);

                return ListTile(
                  leading: Image.asset(
                    imagePath, // 各アクティビティの画像を表示
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
                            activity.distance.toString(),
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                          Text(
                            // 秒を、時分秒に変換
                            formatDuration(activity.time),
                            style: const TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      Column(children: [Icon(icon), Text(activity.day)]),
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
