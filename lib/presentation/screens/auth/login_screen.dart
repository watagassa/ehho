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
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Stack(
        children: [
          // 背景画像（画面の7割を覆う）
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            height: screenHeight * 0.7,
            child: Image.asset(
              'assets/images/shibahu_login.png',
              fit: BoxFit.fill,
              alignment: Alignment.topCenter,
            ),
          ),
          // フクロウ（画面の20%の高さの位置に）
          Positioned(
            top: screenHeight * 0.3,
            left: (screenWidth - 200) / 4, // 左配置
            child: AnimatedOwl(),
          ),

          // ログインUI（中央下部に配置）
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: EdgeInsets.only(bottom: screenHeight * 0.1),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    "ｴｯﾎｴｯﾎ",
                    style: TextStyle(fontSize: screenWidth * 0.04),
                  ),
                  Text(
                    "ここからログインできるって伝えなきゃ",
                    style: TextStyle(fontSize: screenWidth * 0.045),
                  ),
                  Text(
                    "ｴｯﾎｴｯﾎ",
                    style: TextStyle(fontSize: screenWidth * 0.04),
                  ),
                  const SizedBox(height: 10),

                  // Googleログインボタン
                  SizedBox(
                    width: screenWidth * 0.8, // 画面幅の80%
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
                        padding: const EdgeInsets.all(10.0),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            'assets/images/google_icon.png',
                            width: screenWidth * 0.08,
                            height: screenWidth * 0.08,
                          ),
                          const SizedBox(width: 10),
                          Text(
                            "Googleでログイン",
                            style: TextStyle(
                              fontSize: screenWidth * 0.045,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
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
  bool toggle = true;

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder<double>(
      tween: Tween<double>(
        begin: rotationAngle,
        end: toggle ? 15 * math.pi / 180 : -15 * math.pi / 180,
      ),
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeInOut,
      builder: (BuildContext context, double value, Widget? child) {
        return Transform.rotate(
          angle: value,
          child: Image.asset(
            'assets/images/ehho_nomal.png',
            width: MediaQuery.of(context).size.width * 0.4,
            height: MediaQuery.of(context).size.width * 0.4,
          ),
        );
      },
      onEnd: () {
        setState(() {
          toggle = !toggle;
          rotationAngle = toggle ? 15 * math.pi / 180 : -15 * math.pi / 180;
        });
      },
    );
  }
}
