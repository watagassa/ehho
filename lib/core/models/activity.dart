import 'package:intl/intl.dart';

/// supabaseにデータを送信する時に使うクラス
class ActivitySend {
  String user_id;
  int activity;
  double distance;
  int time;

  ActivitySend({
    required this.user_id,
    required this.activity,
    required this.distance,
    required this.time,
  });

  /// データ送信用オブジェクトを返します
  Map<String, dynamic> toObj() {
    return {
      "user_id": user_id,
      "activity": activity,
      "distance": distance,
      "time": time,
    };
  }

  @override
  String toString() {
    return '$user_id, $activity, $distance, $time';
  }
}


/// supabaseから受信したデータを管理するクラス
class ActivityGet {
  int activity_id;
  String user_id;
  int activity;
  double distance;
  int time;
  String day;

  /// 配列用の初期化関数があるからこれは使わないで！！！！
  ActivityGet(Map<String, dynamic> data)
    : activity_id = data['activity_id'] as int,
      user_id = data['user_id'] as String,
      activity = data['activity'] as int,
      distance = (data['distance'] as num).toDouble(),
      time = data['time'] as int,
      day = DateFormat(
        'yyyy-MM-dd HH:mm',
      ).format(DateTime.parse(data['day'] as String).toLocal());


  /// supabaseで取得した配列を、このクラスとしてそれぞれ初期化する。
  /// 
  /// コンストラクタは使わずこちらで初期化してください。
  static List<ActivityGet> listInit(List<Map<String, dynamic>> listData) {
    return listData
        .map((data) => ActivityGet(data))
        .toList();
  }

  int get getActivityId => activity_id;
  String get getUserId => user_id;
  int get getActivity => activity;
  double get getDistance => distance;
  int get getTime => time;
  String get getDay => day;

  @override
  String toString() {
    return '$activity_id, $user_id, $activity, $distance, $time, $day';
  }
}
