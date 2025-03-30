import 'package:flutter/material.dart';

class AchievementCard extends StatelessWidget {
  final String title;
  final String imagePath;
  final double progress; // 進捗率（0.0 〜 1.0）

  const AchievementCard({
    super.key,
    required this.title,
    required this.imagePath,
    required this.progress,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100, // カードの幅を調整
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey[300]!),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(imagePath, width: 50, height: 50, fit: BoxFit.contain),
          const SizedBox(height: 8),
          Text(
            title,
            style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 8),
          MileageBar(progress: progress),
        ],
      ),
    );
  }
}

class MileageBar extends StatelessWidget {
  final double progress;

  const MileageBar({super.key, required this.progress});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 8,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.grey[300],
        borderRadius: BorderRadius.circular(4),
      ),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Container(
          height: 8,
          width: 80 * progress, // 進行度に応じて変化
          decoration: BoxDecoration(
            color: Colors.amber[300],
            borderRadius: BorderRadius.circular(4),
          ),
        ),
      ),
    );
  }
}

// 横スクロールでカードを並べるウィジェット
class AchievementRow extends StatelessWidget {
  const AchievementRow({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 150, // カードの高さに合わせる
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: [
            AchievementCard(
              title: "ヒナ\nフクロウ",
              imagePath: "assets/images/ehho_nomal.png",
              progress: 0.4,
            ),
            AchievementCard(
              title: "健康\nフクロウ",
              imagePath: "assets/images/ehho_walking.png",
              progress: 0.6,
            ),
            AchievementCard(
              title: "熱血\nフクロウ",
              imagePath: "assets/images/ehho_nekketu.png",
              progress: 0.8,
            ),
            AchievementCard(
              title: "覇気\nフクロウ",
              imagePath: "assets/images/ehho_fire.png",
              progress: 0.4,
            ),
            AchievementCard(
              title: "渡鳥\nフクロウ",
              imagePath: "assets/images/ehho_earth.png",
              progress: 0.4,
            ),
            AchievementCard(
              title: "宇宙\nフクロウ",
              imagePath: "assets/images/ehho_cosmic.png",
              progress: 0.4,
            ),
          ],
        ),
      ),
    );
  }
}
