import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';

class MapView extends StatefulWidget {
  final bool isRunning;
  const MapView({super.key, required this.isRunning});

  @override
  _MapViewState createState() => _MapViewState();
}

class _MapViewState extends State<MapView> {
  // マップビューの初期位置
  CameraPosition _initialLocation = const CameraPosition(
    target: LatLng(0.0, 0.0),
  );
  // マップの表示制御用
  late GoogleMapController mapController;

  // 現在位置の記憶用
  Position? _currentPosition;
  double _totalDistance = 0.0;
  LatLng? _lastPosition;

  @override
  void initState() {
    super.initState();
    if (widget.isRunning) {
      _startLocationUpdates();
    }
  }

  // 定期的に位置情報を取得する
  void _startLocationUpdates() {
    Geolocator.getPositionStream(
      locationSettings: const LocationSettings(
        accuracy: LocationAccuracy.high,
        distanceFilter: 15, // 10メートル移動ごとに更新
      ),
    ).listen((Position position) {
      if (mounted) {
        setState(() {
          _currentPosition = position;
          _calculateDistance(LatLng(position.latitude, position.longitude));
        });

        mapController.animateCamera(
          CameraUpdate.newCameraPosition(
            CameraPosition(
              target: LatLng(position.latitude, position.longitude),
              zoom: 18.0,
            ),
          ),
        );
      }
    });
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
    } else {
      setState(() {
        _lastPosition = newPosition;
        _totalDistance = 0.0;
      });
    }

    debugPrint('移動距離: $_totalDistance');
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      width: 800,
      child: Scaffold(
        body: Stack(
          children: <Widget>[
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
            SafeArea(
              child: Align(
                alignment: Alignment.centerRight,
                child: Padding(
                  padding: const EdgeInsets.only(right: 10.0, bottom: 100.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      ClipOval(
                        child: Material(
                          color: Colors.blue.shade100,
                          child: InkWell(
                            splashColor: Colors.blue,
                            child: const SizedBox(
                              width: 40,
                              height: 30,
                              child: Icon(Icons.add),
                            ),
                            onTap: () {
                              mapController.animateCamera(
                                CameraUpdate.zoomIn(),
                              );
                            },
                          ),
                        ),
                      ),
                      const SizedBox(height: 35),
                      ClipOval(
                        child: Material(
                          color: Colors.blue.shade100,
                          child: InkWell(
                            splashColor: Colors.blue,
                            child: const SizedBox(
                              width: 40,
                              height: 30,
                              child: Icon(Icons.remove),
                            ),
                            onTap: () {
                              mapController.animateCamera(
                                CameraUpdate.zoomOut(),
                              );
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SafeArea(
              child: Align(
                alignment: Alignment.bottomRight,
                child: Padding(
                  padding: const EdgeInsets.only(right: 10.0, bottom: 10.0),
                  child: ClipOval(
                    child: Material(
                      color: Colors.orange.shade100,
                      child: InkWell(
                        splashColor: Colors.blue,
                        child: const SizedBox(
                          width: 40,
                          height: 30,
                          child: Icon(Icons.my_location),
                        ),
                        onTap: () {
                          if (_currentPosition != null) {
                            mapController.animateCamera(
                              CameraUpdate.newCameraPosition(
                                CameraPosition(
                                  target: LatLng(
                                    _currentPosition!.latitude,
                                    _currentPosition!.longitude,
                                  ),
                                  zoom: 18.0,
                                ),
                              ),
                            );
                          }
                        },
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: 50.0,
              left: 20.0,
              child: Container(
                padding: const EdgeInsets.all(10.0),
                color: Colors.white.withOpacity(0.7),
                child: Text(
                  '移動距離: ${_totalDistance.toStringAsFixed(2)} m',
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
