// アクティビティの登録、削除、取得処理

import 'package:ehho/config/supabase_config.dart';
import 'package:ehho/core/models/activity.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

// ActivitySevice プロバイダー
final activityServiceProvider = Provider<ActivityService>((ref) {
  return ActivityService(ref);
});

class ActivityService {
  final Ref _ref;
  // 最新のsupabaseクライアントを取得する
  SupabaseClient get _supabaseClient => _ref.read(supabaseClientProvider);

  ActivityService(this._ref); // コンストラクタ

  /// アクティビティを登録する関数
  Future<void> insertActivity({
    required int activity,
    required double distance,
    required int time,
  }) async {
    final userId = _supabaseClient.auth.currentUser?.id;
    if (userId == null) throw ('ユーザーを取得できませんでした。');

    ActivitySend activityData = ActivitySend(
      user_id: userId,
      activity: activity,
      distance: distance,
      time: time,
    );

    final res = await _supabaseClient
        .from('user_activity')
        .insert(activityData.toObj());

    if (res != null) throw ('Activityのsupabaseへの登録に失敗しました。');
  }

  /// アクティビティを削除する関数
  /// 
  /// activity_idを指定してください。
  Future<void> deleteActivity({required activityId}) async {
    final res = await _supabaseClient
        .from('user_activity')
        .delete()
        .eq('activity_id', activityId);

    if (res != null) throw ('アクティビティの削除に失敗しました。');
  }
}
