import 'package:geolocator/geolocator.dart';

Future<Position?> getCurrentLoc() async {
  try {
    // 現在地の設定
    LocationSettings locationSettings = LocationSettings(
      accuracy: LocationAccuracy.high, // 高精度で位置情報を取得
      distanceFilter: 10, // 15メートルごとに位置更新
    );

    // 現在位置を取得
    Position position = await Geolocator.getCurrentPosition(
      locationSettings: locationSettings,
    );

    return position;
  } catch (e) {
    return null;
  }
}
