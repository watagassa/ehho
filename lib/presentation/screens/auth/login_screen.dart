import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:ehho/core/services/login/login_sevice.dart';
import 'package:ehho/core/services/auth_service.dart';

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
                  try {
                    await ref.read(loginServiceProvider).googleLogin();
                  } catch (e) {
                    throw ('Googleログインに失敗しました: $e');
                  }
                  if (context.mounted) {
                    final isRegistered = await ref.read(authServiceProvider).isRegistered();
                    // if(!isRegistered) context.go("/signIn");
                    // else context.go("/home");
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
