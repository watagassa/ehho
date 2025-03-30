import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:ehho/core/services/login/login_sevice.dart';
import 'package:ehho/core/services/auth_service.dart';
import 'dart:math' as math; 

class LoginScreen extends ConsumerWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: Stack(
        children: [
          // 背景画像
          Positioned.fill(
            child: Image.asset(
              'assets/images/background_login.png',
              fit: BoxFit.fitWidth,
              alignment: Alignment.topCenter,
            ),
          ),

          // フクロウ（上に配置）
          Positioned(
            top: 250, // 上からの距離を調整
            child: AnimatedOwl(),
          ),

          // ログインUI（中央に配置）
          Align(
            alignment: Alignment.bottomCenter,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  "ｴｯﾎｴｯﾎ",
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.normal),
                ),
                Text(
                  "ここからログインできるって伝えなきゃ",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.normal),
                ),
                Text(
                  "ｴｯﾎｴｯﾎ",
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.normal),
                ),

                const SizedBox(height: 10),

                // Googleログインボタン
                SizedBox(
                  width: 300,
                  child: ElevatedButton(
                    onPressed: () async {
                      try {
                        await ref.read(loginServiceProvider).googleLogin();
                      } catch (e) {
                        throw ('Googleログインに失敗しました: $e');
                      }
                      final isRegistered =
                          await ref.read(authServiceProvider).isRegistered();
                      if (context.mounted) {
                        if (!isRegistered) {
                          context.go("/signIn");
                        } else {
                          context.go("/home");
                        }
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      foregroundColor: Colors.black54,
                      padding: const EdgeInsets.all(5.0),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          'assets/images/google_icon.png',
                          width: 30,
                          height: 30,
                        ),
                        const SizedBox(width: 10),
                        Text(
                          "Googleでログイン",
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 130),
              ],
            ),
          ),
        ],
      ),
    );
  }
}


class AnimatedOwl extends StatefulWidget {
  @override
  _AnimatedOwlState createState() => _AnimatedOwlState();
}

class _AnimatedOwlState extends State<AnimatedOwl> {
  double rotationAngle = 0;
  bool toggle = true; // どちらの方向に動かすかのフラグ

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder<double>(
      tween: Tween<double>(begin: rotationAngle, end: toggle ? 15 * math.pi / 180 : -15 * math.pi / 180),
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeInOut, // スムーズな動きを追加
      builder: (BuildContext context, double value, Widget? child) {
        return Transform.rotate(
          angle: value,
          child: Image.asset(
            'assets/images/ehho_nomal.png',
            width: 200,
            height: 200,
          ),
        );
      },
      onEnd: () {
        setState(() {
          toggle = !toggle; // 方向を反転
          rotationAngle = toggle ? 15 * math.pi / 180 : -15 * math.pi / 180;
        });
      },
    );
  }
}
