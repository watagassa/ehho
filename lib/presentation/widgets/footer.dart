import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// インデックス管理プロバイダー
final indexProvider = StateProvider((ref) => 0);

class BottomNavi extends ConsumerWidget {
  final void Function(int) onTap;

  const BottomNavi({super.key, required this.onTap});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final index = ref.watch(indexProvider);

    return BottomNavigationBar(
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.directions_run),
          label: 'アクティビティ',
        ),
        BottomNavigationBarItem(icon: Icon(Icons.history), label: '計測履歴'),
      ],
      backgroundColor: Colors.lightGreen,
      selectedItemColor: Colors.white,
      unselectedItemColor: Colors.black,
      currentIndex: index,
      onTap: onTap, // 外部から受け取ったコールバックを使用
    );
  }
}
