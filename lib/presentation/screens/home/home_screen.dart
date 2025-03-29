import 'package:ehho/presentation/widgets/activity/activity_detail_screen.dart';
import 'package:ehho/presentation/widgets/history/history_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// プロバイダー
final indexProvider = StateProvider((ref) {
  // 変化するデータ 0~1
  return 0; // 0 からスタート
});

// 画面全体
class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // インデックス
    final index = ref.watch(indexProvider); //refがプロバイダーの鍵

    // アイテムたち
    const items = [
      BottomNavigationBarItem(
        icon: Icon(Icons.directions_run),
        label: 'アクティビティ',
      ),

      BottomNavigationBarItem(icon: Icon(Icons.history), label: '計測履歴'),
    ];

    final header = AppBar(
      leading: Padding(     //左側に画像読み込み
        padding: EdgeInsets.all(1), // 左側の余白を追加
        child: Image.asset(
          'assets/images/ehho_nomal.png',
          fit: BoxFit.contain,  //画像のサイズを調整
        ),
      ),
      leadingWidth: 100,  //画像配置の幅広げてる
      title: FittedBox(
        child: Text(items[index].label ?? '', style: TextStyle(fontSize: 28)),
      ),
      centerTitle: true,
      actions: [
        Padding(
          padding: const EdgeInsets.all(7),
          child: Image.asset('assets/images/default_user.png'),
        ),
      ],


      backgroundColor: Colors.lightGreen,
      toolbarHeight:80,
    );

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
    final pages = [const ActivityScreen(), const HistoryScreen()];

    return Scaffold(
      appBar: header,
      body: pages[index], 
      bottomNavigationBar: bar
    );
  }
}
