import 'package:ehho/core/services/map/gps_allow.dart';
import 'package:flutter/material.dart';

class GpsallowButton extends StatefulWidget {
  @override
  _GpsallowButtonState createState() => _GpsallowButtonState();
}

class _GpsallowButtonState extends State<GpsallowButton> {
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Checkbox(
          value: isChecked,
          onChanged: (value) async {
            bool result = false;
            // チェックボックスがチェックされた場合、位置情報の許可を確認
            if (!isChecked) {
              try {
                result = await gpsAllow();
                if (result) {
                  // 許可された場合の処理
                  ScaffoldMessenger.of(
                    context,
                  ).showSnackBar(SnackBar(content: Text("位置情報の許可が得られました")));
                }
              } catch (e) {
                // 許可されなかった場合の処理
                ScaffoldMessenger.of(
                  context,
                ).showSnackBar(SnackBar(content: Text("位置情報の許可に失敗しました: $e")));
              }
              setState(() {
                isChecked = result;
              });
            }
          },
        ),
        Text("gpsの許可"),
      ],
    );
  }
}
