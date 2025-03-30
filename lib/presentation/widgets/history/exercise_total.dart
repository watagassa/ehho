import 'package:ehho/core/services/activity_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final totalDistanceProvider = FutureProvider<int>(
  (ref) async => await ref.watch(activityServiceProvider).getDistanceTotal(),
);

class ExerciseTotal extends ConsumerWidget {
  const ExerciseTotal({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final asyncTotalDistance = ref.watch(totalDistanceProvider);

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
                    switch (asyncTotalDistance) {
                      AsyncLoading() => const SizedBox(
                        child: Text(
                          'Loading...',
                          style: distanceStyle,
                          textAlign: TextAlign.right,
                        ),
                      ),
                      AsyncError(:final error) => SizedBox(
                        child: Tooltip(
                          message: error.toString(),
                          child: Text(
                            '読み込めませんでした...',
                            style: distanceStyle,
                            textAlign: TextAlign.right,
                          ),
                        ),
                      ),
                      AsyncData(:final value) => SizedBox(
                        child: Text(
                          '$value km',
                          style: distanceStyle,
                          textAlign: TextAlign.right,
                        ),
                      ),
                      _ => const SizedBox.shrink(),
                    },
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 5),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              const Text(
                '愛知県から京都府\nくらいの距離 !',
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
          ),
        ],
      ),
    );
  }
}
