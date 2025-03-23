import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:ehho/presentation/widgets/activity/dashboard.dart';

class ActivityScreen extends StatelessWidget {
  const ActivityScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 10),
        child: Column(
          children: [
            //運動時間
            const MetricContainer(
              child: Column(
                children: [
                  Text(
                    "00:00:00",
                    style: TextStyle(
                      fontSize: 48,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 4),
                  Text(
                    "運動時間",
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.black54,
                    ),
                  ),
                ],
              ),
            ),
          
            //距離、カロリー、ペース
            const MetricContainer(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  // 距離
                  MetricItem(
                    value: "0.00",
                    label: "距離 [km]",
                  ),
                  
                  // カロリー
                  MetricItem(
                    value: "0",
                    label: "カロリー [kcal]",
                  ),
                  
                  // 平均ペース
                  MetricItem(
                    value: "00:00",
                    label: "平均ペース [min/km]",
                  ),
                ],
              ),
            ),
            
            const SizedBox(height: 20),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  // 新しいアクティビティ開始処理
                },
                child: const Text("新しいアクティビティを開始"),
              ),
            ),
            // 履歴ページへ遷移するボタン(仮置き)
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  // ログイン処理を後で追加
                  // 今はログインボタンを押すとアクティビティページに遷移する
                  // go_router を使用してアクティビティ画面へ遷移
                  context.go("/home");
                },
                child: const Text("履歴ページへ遷移"),
              ),
            ),


            // 残りのスペースを埋める
            const Expanded(child: SizedBox()),
          ],
        ),
      ),
    );
  }
}
