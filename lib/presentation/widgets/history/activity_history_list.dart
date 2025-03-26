import 'package:flutter/material.dart';

class ActivityHistoryList extends StatelessWidget {
  const ActivityHistoryList({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.separated(
        itemCount: 5, // 仮データ数
        separatorBuilder: (_, __) => const Divider(),
        itemBuilder: (context, index) {
          return ListTile(
            leading: Image.asset(
              'assets/images/ehho_walking.png', // 画像パス
              width: 40, // アイコンのサイズ調整
              height: 40,
            ),
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "${(index + 1) * 1.5}km",
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    Text(
                      "${(index + 1).toString().padLeft(2, '0')}:34:56", // 仮の時間
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                Column(
                  children: [
                    const Icon(Icons.wb_sunny), // 現在の天気アイコン
                    const Text("現在"),
                  ],
                ),
              ],
            ),
            onTap: () {
              // 詳細画面へ遷移（今は未実装）
            },
          );
        },
      ),
    );
  }
}
