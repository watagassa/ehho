import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:ehho/presentation/widgets/footer.dart'; // フッターをインポート

class ActivityScreen extends ConsumerWidget {
  const ActivityScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final index = ref.watch(indexProvider);

    // 画面リスト
    final pages = [
      const ActivityScreen(),
      Container(), // 履歴画面（別途作成）
    ];

    return Scaffold(
      appBar: AppBar(title: const Text("アクティビティ"), centerTitle: true),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
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
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  // 新しいアクティビティ開始処理
                },
                child: const Text("新しいアクティビティを開始"),
              ),
            ),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  context.go("/history");
                },
                child: const Text("履歴ページへ遷移"),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavi(
        onTap: (i) => ref.read(indexProvider.notifier).state = i, // 画面切り替え
      ),
    );
  }
}
