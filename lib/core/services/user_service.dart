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
  /// 
  /// 取得できなかった場合はnullを返す
  Future<UserGet?> getUserProfile() async {
    final userId = _supabaseClient.auth.currentUser?.id;

    if (userId != null) {
      final data = await _supabaseClient
          .from('user_profiles')
          .select()
          .eq('user_id', userId);

      // achieveがList<dynamic>になっているのでList<bool>にキャストする
      data[0]['achieve'] = List<bool>.from(data[0]['achieve']);
      
      return UserGet(data[0]);
    } else {
      return null;
    }
  }
}
