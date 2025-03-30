import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ehho/provider/providers.dart';

class MapView extends ConsumerStatefulWidget {
  final bool isRunning;
  const MapView({super.key, required this.isRunning});

  @override
  _MapViewState createState() => _MapViewState();
}

class _MapViewState extends ConsumerState<MapView> {
  @override
  Widget build(BuildContext context) {
    final bool isRunning = widget.isRunning;

    // refを使用して状態やプロバイダーを取得
    final someValue = ref.watch(totalDistanceProvider); // 例: Providerから値を取得

    return Container(
      child: Column(
        children: [
          Text('isRunning: $isRunning'),
          Text('someProvider Value: $someValue'),
        ],
      ),
    );
  }
}
