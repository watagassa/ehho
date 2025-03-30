import 'package:ehho/core/services/activity_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

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
        color:
            progress == 1
                ? const Color.fromARGB(66, 80, 80, 80)
                : Colors.transparent,
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
class AchievementRow extends ConsumerWidget {
  const AchievementRow({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final activityService = ref.watch(activityServiceProvider);

    return FutureBuilder<int>(
      future: activityService.getDistanceTotal(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        } else if (snapshot.hasData) {
          final totalDistance = snapshot.data!;

          List<AchievementCard> achievementCards = [
            AchievementCard(
              title: "ヒナ\nフクロウ",
              imagePath: "assets/images/ehho_nomal.png",
              progress: totalDistance < 5 ? totalDistance / 5 : 1,
            ),
            AchievementCard(
              title: "健康\nフクロウ",
              imagePath: "assets/images/ehho_walking.png",
              progress: totalDistance < 10 ? totalDistance / 10 : 1,
            ),
            AchievementCard(
              title: "熱血\nフクロウ",
              imagePath: "assets/images/ehho_nekketu.png",
              progress: totalDistance < 50 ? totalDistance / 50 : 1,
            ),
            AchievementCard(
              title: "覇気\nフクロウ",
              imagePath: "assets/images/ehho_fire.png",
              progress: totalDistance < 100 ? totalDistance / 100 : 1,
            ),
            AchievementCard(
              title: "渡鳥\nフクロウ",
              imagePath: "assets/images/ehho_earth.png",
              progress: totalDistance < 500 ? totalDistance / 500 : 1,
            ),
            AchievementCard(
              title: "宇宙\nフクロウ",
              imagePath: "assets/images/ehho_cosmic.png",
              progress: totalDistance < 1000 ? totalDistance / 1000 : 1,
            ),
          ];

          List<AchievementCard> achieved = [];
          List<AchievementCard> notAchieved = [];

          for (var card in achievementCards) {
            if (card.progress == 1) {
              achieved.add(card);
            } else {
              notAchieved.add(card);
            }
          }

          return SizedBox(
            height: 150,
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(children: [...notAchieved, ...achieved]),
            ),
          );
        } else {
          return const Center(child: Text('No data'));
        }
      },
    );
  }
}
