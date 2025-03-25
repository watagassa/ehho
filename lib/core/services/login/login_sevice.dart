import 'dart:io';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:ehho/config/supabase_config.dart';

// LoginSevice プロバイダー
final loginServiceProvider = Provider<LoginService>((ref) {
  return LoginService(ref);
});

class LoginService {
  final Ref _ref;
  SupabaseClient get _supabaseClient => _ref.read(supabaseClientProvider);
  
  LoginService(this._ref);

  // Android, IOS 用
  Future<void> googleLogin() async {
    final webClientId = dotenv.env['WEB_CLIENT_ID'];
    final androidClientId = dotenv.env['ANDROID_CLIENT_ID'];
    final iosClientId = dotenv.env['IOS_CLIENT_ID'];

    if (webClientId == null || androidClientId == null || iosClientId == null) {
      throw Exception('envファイルにweb,android,ios関連の値が見つかりませんでした。');
    }

    final GoogleSignIn googleSignIn = GoogleSignIn(
      clientId: Platform.isAndroid ? androidClientId : iosClientId,
      serverClientId: webClientId,
    );
    final googleUser = await googleSignIn.signIn();
    final googleAuth = await googleUser!.authentication;
    final accessToken = googleAuth.accessToken;
    final idToken = googleAuth.idToken;

    if (accessToken == null) {
      throw 'アクセストークンが見つかりませんでした。';
    }
    if (idToken == null) {
      throw 'IDトークンが見つかりませんでした。';
    }

    await _supabaseClient.auth.signInWithIdToken(
      provider: OAuthProvider.google,
      idToken: idToken,
      accessToken: accessToken,
    );
  }
}

