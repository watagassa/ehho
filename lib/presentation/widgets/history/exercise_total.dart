import 'package:ehho/core/services/activity_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final totalDistance = FutureProvider<int>(
  (ref) async => ref.watch(activityServiceProvider).getDistanceTotal(),
);

class ExerciseTotal extends ConsumerWidget {
  const ExerciseTotal({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final watcher = ref.watch(totalDistance);

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
                decoration: BoxDecoration(
                  border: const Border(
                    bottom: BorderSide(
                      color: Color.fromARGB(50, 0, 0, 0),
                      width: 1,
                    ),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  textBaseline: TextBaseline.alphabetic,
                  children: [
                    Text('累計', style: labelStyle),
                    switch (watcher) {
                      AsyncLoading() => SizedBox(
                        width: 220,
                        child: Text(
                          'Loading...',
                          style: distanceStyle,
                          textAlign: TextAlign.right,
                        ),
                      ),
                      AsyncError() => SizedBox(
                        width: 220,
                        child: Text(
                          '読み込めませんでした。',
                          style: distanceStyle,
                          textAlign: TextAlign.right,
                        ),
                      ),
                      AsyncValue<int>() => SizedBox(
                        width: 220,
                        child: Text(
                          '$totalDistance km',
                          style: distanceStyle,
                          textAlign: TextAlign.right,
                        ),
                      ),
                    },
                    SizedBox(
                      width: 220,
                      child: Text(
                        '$totalDistance km',
                        style: distanceStyle,
                        textAlign: TextAlign.right,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: 5),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(
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
