import 'package:ehho/core/services/activity_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// FutureProvider は削除 (または activityServiceProvider が Provider であることを想定)
// activityServiceProvider が Provider<ActivityService> であると仮定します
// final activityServiceProvider = Provider<ActivityService>((ref) => ActivityService());


class ExerciseTotal extends ConsumerWidget {
  const ExerciseTotal({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final activityService = ref.watch(activityServiceProvider);

    const TextStyle labelStyle = TextStyle(fontSize: 20, color: Colors.black);
    const TextStyle distanceStyle = TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.bold,
      color: Colors.black,
    );
    const TextStyle comparisonStyle = TextStyle(
      fontSize: 15,
      color: Colors.black,
      height: 1.3,
    );

    return FutureBuilder<int>(
      future: activityService.getDistanceTotal(),
      builder: (context, snapshot) {
        Widget distanceContent;
        Widget comparisonContent;

        if (snapshot.connectionState == ConnectionState.waiting) {
          distanceContent = const SizedBox(
            child: Text(
              'Loading...',
              style: distanceStyle,
              textAlign: TextAlign.right,
            ),
          );
          comparisonContent = Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              const Text(
                'Loading...',
                style: comparisonStyle,
                textAlign: TextAlign.left,
              ),
              Image.asset(
                "assets/images/ehho_nomal.png",
                width: 75,
                height: 75,
                fit: BoxFit.contain,
              ),
            ],
          );
        } else if (snapshot.hasError) {
          distanceContent = SizedBox(
            child: Tooltip(
              message: snapshot.error.toString(),
              child: const Text(
                '読み込めませんでした...',
                style: distanceStyle,
                textAlign: TextAlign.right,
              ),
            ),
          );
          comparisonContent = Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              const Text(
                '読み込めませんでした...',
                style: comparisonStyle,
                textAlign: TextAlign.left,
              ),
              Image.asset(
                "assets/images/ehho_nomal.png",
                width: 75,
                height: 75,
                fit: BoxFit.contain,
              ),
            ],
          );
        } else if (snapshot.hasData) {
          final value = snapshot.data!;
          distanceContent = SizedBox(
            child: Text(
              '$value km',
              style: distanceStyle,
              textAlign: TextAlign.right,
            ),
          );
          comparisonContent = Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              if (value < 5) ...[
                const Text(
                  'ｴｯﾎｴｯﾎ\n一緒に頑張らなきゃ',
                  style: comparisonStyle,
                  textAlign: TextAlign.left,
                ),
                Image.asset(
                  "assets/images/ehho_nomal.png",
                  width: 75,
                  height: 75,
                  fit: BoxFit.contain,
                ),
              ] else if (value < 10) ...[
                const Text(
                  'ｴｯﾎｴｯﾎ\n楽しくなってきた',
                  style: comparisonStyle,
                  textAlign: TextAlign.left,
                ),
                Image.asset(
                  "assets/images/ehho_walking.png",
                  width: 75,
                  height: 75,
                  fit: BoxFit.contain,
                ),
              ] else if (value < 50) ...[
                const Text(
                  'ｴｯﾎｴｯﾎ\nこの調子、この調子',
                  style: comparisonStyle,
                  textAlign: TextAlign.left,
                ),
                Image.asset(
                  "assets/images/ehho_nekketu.png",
                  width: 75,
                  height: 75,
                  fit: BoxFit.contain,
                ),
              ] else if (value < 100) ...[
                const Text(
                  'ｴｯﾎｴｯﾎ\n運動しなきゃ',
                  style: comparisonStyle,
                  textAlign: TextAlign.left,
                ),
                Image.asset(
                  "assets/images/ehho_fire.png",
                  width: 75,
                  height: 75,
                  fit: BoxFit.contain,
                ),
              ] else ...[
                const Text(
                  'ｴｯﾎｴｯﾎ\n渡り鳥にも負けない',
                  style: comparisonStyle,
                  textAlign: TextAlign.left,
                ),
                Image.asset(
                  "assets/images/ehho_cosmic.png",
                  width: 75,
                  height: 75,
                  fit: BoxFit.contain,
                ),
              ],
            ],
          );
        } else {
          distanceContent = const SizedBox.shrink();
          comparisonContent = const SizedBox.shrink();
        }

        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 2.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Column(
                children: [
                  Container(
                    width: 270,
                    decoration: const BoxDecoration(
                      border: Border(
                        bottom: BorderSide(
                          color: Color.fromARGB(50, 0, 0, 0),
                          width: 1,
                        ),
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.alphabetic,
                      children: [
                        const Text('累計', style: labelStyle),
                        const Spacer(),
                        distanceContent,
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 5),
              comparisonContent,
            ],
          ),
        );
      },
    );
  }
}