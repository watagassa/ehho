/// supabaseにデータを送信する時に使うクラス
class UserSend {
  String user_id;
  String name;
  double height;
  double weight;

  UserSend({
    required this.user_id,
    required this.name,
    required this.height,
    required this.weight,
  });

  /// データ送信用オブジェクトを返します
  Map<String, dynamic> toObj() {
    return {
      "user_id": user_id,
      "name": name,
      "height": height,
      "weight": weight,
    };
  }
}


/// supabaseから受信したデータを管理するクラス
class UserGet {
  String user_id;
  String name;
  double height;
  double weight;
  List<bool> achieve;

  UserGet(Map<String, dynamic> data)
    : user_id = data['user_id'] as String,
      name = data['name'] as String,
      height = (data['height'] as num).toDouble(),
      weight = (data['weight'] as num).toDouble(),
      achieve = data['achieve'] as List<bool>;

  String get getUserId => user_id;
  String get getName => name;
  double get getHeight => height;
  double get getWeight => weight;
  List<bool> get getAchieve => achieve;
}
