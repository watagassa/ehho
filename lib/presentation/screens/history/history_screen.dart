import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HistoryScreen extends StatelessWidget {
  const HistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("計測履歴"), centerTitle: true),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Expanded(
              child: ListView.separated(
                itemCount: 5, // 仮データ数
                separatorBuilder: (_, __) => const Divider(),
                itemBuilder: (context, index) {
                  return ListTile(
                    leading: const Icon(Icons.history),
                    title: Text("2025-03-${index + 10}"),
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
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  // ログイン処理を後で追加
                  // 今はログインボタンを押すとアクティビティページに遷移する
                  // go_router を使用してアクティビティ画面へ遷移
                  context.go("/activity");
                },
                child: const Text("アクテビティページへ遷移"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
