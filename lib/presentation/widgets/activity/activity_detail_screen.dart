import 'dart:async';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:ehho/presentation/widgets/activity/dashboard.dart';
import 'package:ehho/presentation/widgets/activity/activity_custombutton_group.dart';

class ActivityScreen extends StatefulWidget {
  const ActivityScreen({super.key});

  @override
  State<ActivityScreen> createState() => _ActivityScreenState();
}

class _ActivityScreenState extends State<ActivityScreen> {
  Timer? _timer;
  int _seconds = 0;
  double _distance = 0.1; // 初期値 (km)
  int selectedMode = 0; // 0:ランニング, 1:ウォーキング, 2:サイクリング
  static const double weight = 60.0; // 仮の体重 (60kg)

  // メッツの値
  final List<double> mets = [9.0, 3.5, 6.0];

  void _startActivity() {
    _timer?.cancel();
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        _seconds++;
        _distance += 0.01; // 1秒ごとに0.01km加算（仮の値）
      });
    });
  }

  double _calculateCalories() {
    double metsValue = mets[selectedMode];
    double hours = _seconds / 3600;
    return metsValue * weight * hours * 1.05;
  }

  String _calculatePace() {
    if (_distance == 0) return "00:00";
    double pace = _seconds / 60 / _distance;
    int minutes = pace.floor();
    int seconds = ((pace - minutes) * 60).floor();
    return "$minutes:${seconds.toString().padLeft(2, '0')}";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 10),
        child: Column(
          children: [
            // 運動時間
            MetricContainer(
              child: Column(
                children: [
                  Text(
                    "${(_seconds ~/ 3600).toString().padLeft(2, '0')}:${((_seconds % 3600) ~/ 60).toString().padLeft(2, '0')}:${(_seconds % 60).toString().padLeft(2, '0')}",
                    style: const TextStyle(fontSize: 48, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 4),
                  const Text("運動時間", style: TextStyle(fontSize: 16, color: Colors.black54)),
                ],
              ),
            ),
            
            // 距離、カロリー、ペース
            MetricContainer(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  MetricItem(value: _distance.toStringAsFixed(2), label: "距離 [km]"),
                  MetricItem(value: _calculateCalories().toStringAsFixed(1), label: "カロリー [kcal]"),
                  MetricItem(value: _calculatePace(), label: "平均ペース [min/km]"),
                ],
              ),
            ),

            // モードカスタムボタン
            ModeButtonGroup(onModeChange: (index) {
              setState(() {
                selectedMode = index;
              });
            }),

            const SizedBox(height: 20),
            SizedBox(
              width: 300,
              child: ElevatedButton(
                onPressed: _startActivity,
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 238, 229, 153),
                  foregroundColor: Colors.black54,
                  padding: const EdgeInsets.all(5.0),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                ),
                child: const Text("新しいアクティビティを開始"),
              ),
            ),

            const Expanded(child: SizedBox()),
          ],
        ),
      ),
    );
  }
}
