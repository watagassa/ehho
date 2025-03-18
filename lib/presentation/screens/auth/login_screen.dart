import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
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

              // メールアドレス入力
              TextField(
                decoration: InputDecoration(
                  labelText: "メールアドレス",
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 20),

              // パスワード入力
              TextField(
                obscureText: true,
                decoration: InputDecoration(
                  labelText: "パスワード",
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 20),

              // ログインボタン
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    // ログイン処理を後で追加
                    // 今はログインボタンを押すとアクティビティページに遷移する
                    // go_router を使用してアクティビティ画面へ遷移
                    context.go("/activity");
                  },

                  child: const Text("ログイン(activityへ遷移)"),
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
