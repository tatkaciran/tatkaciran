import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:geocoding/geocoding.dart';
import 'package:instajobs/config/managers/managers.dart';

class DefineLocationButtonManager extends ChangeNotifier {
  DefineLocationButtonManager({
    required LocationManager locationManager,
    required AddressManager addressManager,
  })  : _locationManager = locationManager,
        _addressManager = addressManager;
  final LocationManager _locationManager;
  final AddressManager _addressManager;

  Future<void> initialize() async {
    _locationManager.initialize();

    await getCurrentPlace();
    _setLocationDefined();
    setGeocodingDone();
    _setAddress();
    notifyListeners();
  }

  Future<void> getCurrentPlace() async {
    await _addressManager.getCurrentPlace();

    print(_addressManager.placemark.toString());

    notifyListeners();
  }

  bool _isLocationDefined = false;
  bool get isLocationDefined => _isLocationDefined;
  void _setLocationDefined() {
    _isLocationDefined = _locationManager.isLocationDefined;
    notifyListeners();
  }

  bool _isGeocodingDone = false;
  bool get isGeocodingDone => _isGeocodingDone;
  void setGeocodingDone() {
    _isGeocodingDone = _addressManager.isGeocodingDone;
    notifyListeners();
  }

  String _address = '';
  String get address => _address;
  void _setAddress() {
    if (_isLocationDefined) {
      if (_isGeocodingDone) {
        _address = _addressManager.placemark.toString();
        notifyListeners();
      }
    }
  }
}
