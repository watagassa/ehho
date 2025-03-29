import 'package:ehho/core/services/map/googlemap_service.dart';
import 'package:ehho/core/services/map/googlemap_service.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ActivityScreen extends StatelessWidget {
  const ActivityScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 10),
        child: Column(
          children: [
            Expanded(
              child: ListView.separated(
                itemCount: 5, // 仮のデータ数
                separatorBuilder: (_, __) => const Divider(),
                itemBuilder: (context, index) {
                  return ListTile(
                    leading: const Icon(Icons.directions_run),
                    title: Text("ランニング ${index + 1}"),
                    subtitle: Text("距離: ${(index + 1) * 2} km"),
                    trailing: const Icon(Icons.arrow_forward_ios),
                    onTap: () {
                      // クリック時の動作（今はなし）
                    },
                  );
                },
              ),
            ),
            const SizedBox(height: 20),
            SizedBox(
              width: 300,
              child: ElevatedButton(
                onPressed: () {
                  // 新しいアクティビティ開始処理
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 238, 229, 153),
                  foregroundColor: Colors.black54,
                  padding: const EdgeInsets.all(5.0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: const Text("新しいアクティビティを開始"),
              ),
            ),
            // 履歴ページへ遷移するボタン(仮置き)
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  // ログイン処理を後で追加
                  // 今はログインボタンを押すとアクティビティページに遷移する
                  // go_router を使用してアクティビティ画面へ遷移
                  context.go("/history");
                },
                child: const Text("履歴ページへ遷移"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}