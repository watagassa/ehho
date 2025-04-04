// ユーザー情報の取得

import 'dart:async';

import 'package:ehho/config/supabase_config.dart';
import 'package:ehho/core/models/user.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

// UserService プロバイダー
final userServiceProvider = Provider<UserService>((ref) {
  return UserService(ref);
});

class UserService {
  final Ref _ref;
  // 最新のsupabaseクライアントを取得する
  SupabaseClient get _supabaseClient => _ref.read(supabaseClientProvider);

  UserService(this._ref); // コンストラクタ

  /// ユーザー情報を取得する
  Future<UserGet?> getUserProfile() async {
    final userId = _supabaseClient.auth.currentUser?.id;
    if (userId == null) throw ('ユーザーを取得できませんでした。');

    try {
      final data = await _supabaseClient
          .from('user_profiles')
          .select()
          .eq('user_id', userId);
      // achieveがList<dynamic>になっているのでList<bool>にキャストする
      data[0]['achieve'] = List<bool>.from(data[0]['achieve']);

      return UserGet(data[0]);
    } catch (e) {
      throw ('ユーザー情報取得中にエラーが発生しました。$e');
    }
  }

  /// ユーザーアイコンを取得する関数
  ///
  /// 取得できなかった場合はデフォルトアイコンを返す
  String getUserIconURL() {
    final url = _supabaseClient.auth.currentUser?.userMetadata?['avatar_url'];
    if (url != null) return url;
    return 'https://kotonohaworks.com/free-icons/wp-content/uploads/kkrn_icon_user_1.png';
  }
}
