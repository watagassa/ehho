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
<<<<<<< HEAD
        padding: const EdgeInsets. all(0),
        child: Column(
          children: [
          Positioned.fill(
            child: Image.asset(
              'assets/images/background_login.png',
              fit: BoxFit.cover,
              // fit: BoxFit.fitWidth,
            ),
=======
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
                  style: ElevatedButton.styleFrom(
                    fixedSize: Size(800, 50),
                    backgroundColor: Colors.amber[200],
                  ),
                  onPressed: () {
                    // ログイン処理を後で追加
                    // 今はログインボタンを押すとアクティビティページに遷移する
                    // go_router を使用してhome画面へ遷移
                    context.go("/signIn");
                  },

                  child: const Text("ログイン(signInへ遷移)",
                  style: TextStyle(
                    fontSize: 22,
                    color: Colors.grey,
                    fontWeight: FontWeight.bold,
                  ),
                  ),
                ),
              ),
              const SizedBox(height: 20),

              // 新規登録ボタン
              TextButton(
                style: TextButton.styleFrom(
                  fixedSize: Size(800, 50),
                    backgroundColor: Colors.amber[200],
                ),
                onPressed: () {
                  // 新規登録画面へ遷移
                },
                child: const Text("新規登録はこちら",
                style: TextStyle(
                    fontSize: 22,
                    color: Colors.grey,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
>>>>>>> Uchida_map_02
          ),
          
          const SizedBox(height: 20),

          //テキスト
          Align(
            alignment: Alignment.center,
            child: Column( 
              mainAxisSize: MainAxisSize.min,
              children: [ 
                Text("ｴｯﾎｴｯﾎ", style: TextStyle(fontSize: 14, fontWeight: FontWeight.normal),),
                Text("ここからログインできるって伝えなきゃ", style: TextStyle(fontSize: 16, fontWeight: FontWeight.normal),),
                Text("ｴｯﾎｴｯﾎ", style: TextStyle(fontSize: 14, fontWeight: FontWeight.normal),),  
              ],
            ),
          ),
          
          const SizedBox(height: 20),

          // ログインボタン
          SizedBox(
            width: 300,
              child: ElevatedButton(
                onPressed: () async {
                  final loginService = ref.read(loginServiceProvider);
                  try {
                    await loginService.googleLogin();
                  } catch (e) {
                    throw ('Googleログインに失敗しました: $e');
                  }
                  if (context.mounted) {
                    // ログイン処理が終わり次第signInに遷移
                    context.go("/signIn");
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
                    Image.asset('assets/images/google_icon.png', width: 32, height: 32),
                    const SizedBox(width: 10),
                    Text("Googleでログイン",style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
