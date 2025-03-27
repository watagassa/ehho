import 'package:flutter/material.dart';

class ActivityHistoryList extends StatelessWidget {
  const ActivityHistoryList({super.key});

  @override
  Widget build(BuildContext context) {
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
              itemCount: 10, // 仮データ数
              separatorBuilder: (_, __) => const Divider(),
              itemBuilder: (context, index) {
                return ListTile(
                  leading: Image.asset(
                    'assets/images/ehho_walking.png',
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
                            "0.0km",
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                          Text(
                            "00:00:00",
                            style: const TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          const Icon(Icons.wb_sunny),
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
          ),
        ),
      ),
    );
  }
}
