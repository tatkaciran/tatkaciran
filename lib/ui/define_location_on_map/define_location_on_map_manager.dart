import 'package:flutter/foundation.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:instajobs/config/managers/managers.dart';

class DefineLocationOnMapManager extends ChangeNotifier {
  DefineLocationOnMapManager({
    required GoogleMapManager googleMapManager,
    required GeolocatorManager geolocatorManager,
    required LocationManager locationManager,
  }) {
    _googleMapManager = googleMapManager;
    _geolocatorManager = geolocatorManager;
    _locationManager = locationManager;
  }

  late GoogleMapManager _googleMapManager;
  late GeolocatorManager _geolocatorManager;
  late LocationManager _locationManager;

  void get locationManagerInitialize => _locationManager.initialize();

  bool _isCurrentLocationFind = false;
  bool get isCurrentLocationFind => _isCurrentLocationFind;

  Future<void> setCurrentLocationFind() async {
    _isCurrentLocationFind = true;
    notifyListeners();

    await _geolocatorManager.initialize().whenComplete(() async {
      await _animateCamera(
        LatLng(
          _geolocatorManager.position.latitude,
          _geolocatorManager.position.longitude,
        ),
      ).whenComplete(() {
        _isCurrentLocationFind = false;
        notifyListeners();
      });
    });
  }

  CameraPosition get initialCameraPosition =>
      _googleMapManager.initialCameraPosition();

  void Function(GoogleMapController) get onMapCreated =>
      _googleMapManager.onMapCreated;

  GoogleMapController get googleMapController =>
      _googleMapManager.googleMapController;

  void Function() get pickLocationOnMap => _googleMapManager.pickLocationOnMap;

  Future<void> _animateCamera(LatLng latLng) async {
    CameraPosition _cameraPosition = CameraPosition(
      target: latLng,
      zoom: 19,
    );
    CameraUpdate _cameraUpdate =
        CameraUpdate.newCameraPosition(_cameraPosition);
    await _googleMapManager.googleMapController.animateCamera(_cameraUpdate);
  }
}
