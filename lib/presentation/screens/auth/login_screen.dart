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
        padding: const EdgeInsets. all(0),
        child: Column(
          children: [
          Positioned.fill(
            child: Image.asset(
              'assets/images/background_login.png',
              fit: BoxFit.cover,
              // fit: BoxFit.fitWidth,
            ),
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
