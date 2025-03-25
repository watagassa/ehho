import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:ehho/core/services/login/login_sevice.dart';

class LoginScreen extends ConsumerWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // アプリ名
              const Text(
                "ehho",
                style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 40),

              // ログインボタン
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () async {
                    final loginService = ref.read(loginServiceProvider);
                    try {
                      await loginService.googleLogin();
                    } catch (e) {
                      throw ('Googleログインに失敗しました: $e');
                    }
                    if (context.mounted) { // ログイン処理が終わり次第signInに遷移
                      context.go("/home");
                    }
                  },
                  child: const Text("ログイン"),
                ),
              ),
              const SizedBox(height: 20),

              // 新規登録ボタン
              TextButton(
                onPressed: () {
                  // 新規登録画面へ遷移
                },
                child: const Text("新規登録はこちら"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
