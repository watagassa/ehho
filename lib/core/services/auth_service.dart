// ログイン・ログアウト・ユーザー登録の処理

import 'package:ehho/config/supabase_config.dart';
import 'package:ehho/core/models/user.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

// AuthSevice プロバイダー
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
      if (userId == null) throw ('ユーザーを取得できませんでした。');

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
      throw ('ユーザー情報登録有無判定中にエラーが発生しました。$e');
    }
  }

  /// ユーザー登録関数
  ///
  /// 名前、身長、体重　が必要
  Future<void> registerUser({
    required String name,
    required double height,
    required double weight,
  }) async {
    final userId = _supabaseClient.auth.currentUser?.id;
    if (userId == null) throw ('ユーザーを取得できませんでした。');

    // 念のためユーザーが登録されてないときのみ送信するようにする
    final userExist = await isRegistered();
    if (!userExist) {
      UserSend userData = UserSend(
        user_id: userId,
        name: name,
        height: height,
        weight: weight,
      );

      try {
        final _ = await _supabaseClient
            .from('user_profiles')
            .insert(userData.toObj());
      } catch (e) {
        throw ('ユーザー:$name の登録中にエラーが発生しました。$e');
      }
    }
  }
}
