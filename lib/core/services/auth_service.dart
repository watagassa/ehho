// ログイン・ログアウト・ユーザー登録の処理

import 'package:ehho/config/supabase_config.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

// LoginSevice プロバイダー
final authServiceProvider = Provider<AuthService>((ref) {
  return AuthService(ref);
});

class AuthService {
  final Ref _ref;
  // 最新のsupabaseクライアントを取得する
  SupabaseClient get _supabaseClient => _ref.read(supabaseClientProvider);

  AuthService(this._ref); // コンストラクタ

  /// ログイン中のユーザーが身長体重等の情報を登録したかどうか
  /// 
  /// ログイン後の画面遷移の分岐に使う
  Future<bool> isRegistered() async {
    try {
      final userId = _supabaseClient.auth.currentUser?.id;
      if (userId == null) {
        return false;
      }
      final data =
          await _supabaseClient
              .from('user_profiles')
              .select('user_id')
              .eq('user_id', userId)
              .limit(1)
              .maybeSingle();

      if (data != null) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      throw ('ERROR $e');
    }
  }

  
}
