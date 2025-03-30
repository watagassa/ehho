import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({super.key});

  @override
  _MapScreenState createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  GoogleMapController? mapController;
  LatLng? _currentPosition;
  double _totalDistance = 0.0;
  LatLng? _lastPosition;

  @override
  void initState() {
    super.initState();
    _getCurrentLocation();
  }

  // 現在地を取得
  Future<void> _getCurrentLocation() async {
    Position position = await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high,
    );

    setState(() {
      _currentPosition = LatLng(position.latitude, position.longitude);
      _lastPosition = _currentPosition;
    });

    // 現在地を基準にマップを更新
    _moveCameraToCurrentPosition();
  }

  // マップのカメラを現在地に移動
  void _moveCameraToCurrentPosition() {
    if (_currentPosition != null && mapController != null) {
      mapController!.animateCamera(CameraUpdate.newLatLng(_currentPosition!));
    }
  }

  // 移動距離を計算
  void _calculateDistance(LatLng newPosition) {
    if (_lastPosition != null) {
      double distanceInMeters = Geolocator.distanceBetween(
        _lastPosition!.latitude,
        _lastPosition!.longitude,
        newPosition.latitude,
        newPosition.longitude,
      );

      setState(() {
        _totalDistance += distanceInMeters;
        _lastPosition = newPosition;
      });
    }
  }

  // 現在地を更新して移動距離を計算
  void _updateLocation() async {
    Position position = await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high,
    );
    LatLng newPosition = LatLng(position.latitude, position.longitude);

    // 移動距離の計算
    _calculateDistance(newPosition);

    setState(() {
      _currentPosition = newPosition;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SizedBox(
            height: 300,
            width: 400,
            child: GoogleMap(
              onMapCreated: (controller) {
                mapController = controller;
              },
              initialCameraPosition: CameraPosition(
                target: _currentPosition ?? LatLng(0, 0),
                zoom: 15,
              ),
              myLocationEnabled: true,
              myLocationButtonEnabled: false,
            ),
          ),
          Positioned(
            bottom: 50,
            left: 20,
            child: ElevatedButton(
              onPressed: _updateLocation,
              child: Text("Update Location"),
            ),
          ),
          Positioned(
            bottom: 100,
            left: 20,
            child: Text(
              'Total Distance: ${(_totalDistance / 1000).toStringAsFixed(2)} km',
              style: TextStyle(fontSize: 18),
            ),
          ),
        ],
      ),
    );
  }
}
