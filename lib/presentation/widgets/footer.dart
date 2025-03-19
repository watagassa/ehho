import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ehho/presentation/screens/activity/activity_detail_screen.dart';
import 'package:ehho/presentation/screens/history/history_screen.dart';


// プロバイダー
final indexProvider = StateProvider((ref) {
  // 変化するデータ 0~1
  return 0;// 0 からスタート
});

// 画面全体
class BottomNavi extends ConsumerWidget {
  const BottomNavi({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // インデックス
    final index = ref.watch(indexProvider);//refがプロバイダーの鍵

    // アイテムたち
    const items = [
      
      BottomNavigationBarItem(
        icon: Icon(Icons.directions_run),
        label: 'アクティビティ',
      ),

      BottomNavigationBarItem(
        icon: Icon(Icons.history),
        label: '計測履歴',
      ),

    ];

    // 下のバー
    final bar = BottomNavigationBar(
      items: items, // アイテムたち
      backgroundColor: Colors.lightGreen, // バーの色
      selectedItemColor: Colors.white, // 選ばれたアイテムの色
      unselectedItemColor: Colors.black, // 選ばれていないアイテムの色
      currentIndex: index, // インデックス
      onTap: (index) {
        // タップされたとき インデックスを変更する
        ref.read(indexProvider.notifier).state = index;
      },
    );

    // 画面たち
    final pages = [
      const ActivityScreen(),
      const HistoryScreen(),
    ];

    return Scaffold(
      body: pages[index],
      bottomNavigationBar: bar,
    );
  }
}