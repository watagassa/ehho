import 'package:flutter/material.dart';
// Google Mapsのパッケージをインポートする
import 'package:google_maps_flutter/google_maps_flutter.dart'; // 追加



class MapView extends StatefulWidget {
 
  @override
  _MapViewState createState() => _MapViewState();
}

class _MapViewState extends State<MapView> {
// マップビューの初期位置
  CameraPosition _initialLocation = CameraPosition(target: LatLng(0.0, 0.0)); // 追加
  // マップの表示制御用
  late GoogleMapController mapController; // 追加

  @override
  Widget build(BuildContext context) {
    // 画面の幅と高さを決定する
    // var height = MediaQuery.of(context).size.height;
    // var width = MediaQuery.of(context).size.width;

    return Container(
      height: 200,
      width: 800,
      child: Scaffold(
        body: Stack(
          children: <Widget>[
            // ここに地図を追加
            // 追加
            GoogleMap(
              initialCameraPosition: _initialLocation,
              myLocationEnabled: true,
              myLocationButtonEnabled: false,
              mapType: MapType.normal,
              zoomGesturesEnabled: true,
              zoomControlsEnabled: false,
              onMapCreated: (GoogleMapController controller) {
                mapController = controller;
              },
            ),
          ],
        ),
      ),
    );
  }
}