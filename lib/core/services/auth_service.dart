// ログイン・ログアウト・ユーザー登録の処理
// profile登録時の既に登録してるか否かの判定

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
  /// 登録画面での分岐に使う
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
