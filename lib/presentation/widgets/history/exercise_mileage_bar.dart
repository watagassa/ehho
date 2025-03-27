import 'package:flutter/material.dart';

class ExerciseMileageBar extends StatelessWidget {
  final double mileage; // 現在の距離
  final double maxMileage; // 最大距離
  final List<double> checkpoints; // 仕切り位置（km単位）

  const ExerciseMileageBar({
    super.key,
    required this.mileage,
    required this.maxMileage,
    this.checkpoints = const [1.0, 4.0, 6.0, 9.0], // km単位で仕切り設定
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        LayoutBuilder(
          builder: (context, constraints) {
            double barWidth = constraints.maxWidth; // バー全体の幅
            double progress = (mileage / maxMileage).clamp(
              0.0,
              1.0,
            ); // 進行度（0~1）

            return Stack(
              // clipBehavior: Clip.none, // 文字がはみ出ても表示
              children: [
                SizedBox(height: 50),
                // 背景バー
                Container(
                  height: 20,
                  width: barWidth,
                  decoration: BoxDecoration(
                    color: Colors.grey[300],
                    borderRadius: BorderRadius.circular(6),
                  ),
                ),
                // 進行バー
                Container(
                  height: 20,
                  width: barWidth * progress,
                  decoration: BoxDecoration(
                    color: Colors.amber[300],
                    borderRadius: BorderRadius.circular(6),
                  ),
                ),
                // 仕切りと距離ラベル
                ...checkpoints.map((checkpoint) {
                  double position =
                      (checkpoint / maxMileage).clamp(0.0, 1.0) * barWidth;

                  return Positioned(
                    left: position - 20, // 仕切りの位置調整
                    top: 0,
                    bottom: 0,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Container(width: 2, height: 20, color: Colors.black),
                        const SizedBox(height: 4), // 余白
                        Text(
                          "${checkpoint.toStringAsFixed(1)} km",
                          style: const TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                            color: Colors.black, // 見やすい色にする
                          ),
                        ),
                      ],
                    ),
                  );
                }),
              ],
            );
          },
        ),
      ],
    );
  }
}
