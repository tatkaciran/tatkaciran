// ignore_for_file: avoid_print

import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:location_picker_with_google_maps/location_picker_with_google_maps.dart';

class GoogleMapManager {
  final LocationManager locationManager;
  GoogleMapManager(this.locationManager) {
    locationManager.initialize();
    if (locationManager.isLocationDefined) {
      setLatLng(locationManager.latLng!);
    }
  }

  LatLng _latLng = const LatLng(0, 0);
  LatLng get latlng => _latLng;

  void setLatLng(LatLng? latLng) {
    if (latLng != null && latLng != const LatLng(0, 0)) {
      _latLng = latLng;
    }
  }

  bool _isMapCreated = false;
  bool get isMapCreated => _isMapCreated;

  late GoogleMapController? _controller;
  GoogleMapController get googleMapController => _controller!;
  void onMapCreated(GoogleMapController? googleMapController) {
    if (googleMapController != null) {
      _controller = googleMapController;
      if (_controller != null) {
        _isMapCreated = true;
      }
    }
  }

  void pickLocationOnMap() {
    Future(() => _controller!.getVisibleRegion())
        .then(_latLngBoundsToCenterLatlng);
  }

  void _latLngBoundsToCenterLatlng(LatLngBounds? latLngBounds) {
    if (latLngBounds != null) {
      LatLng? latLng;
      latLng = LatLng(
        (latLngBounds.southwest.latitude + latLngBounds.northeast.latitude) / 2,
        (latLngBounds.southwest.longitude + latLngBounds.northeast.longitude) /
            2,
      );
      if (latLng != const LatLng(0, 0)) {
        locationManager.setLatLngToHive(latLng);
      }
    }
  }

  CameraPosition initialCameraPosition([LatLng? latLng]) => CameraPosition(
        target: latLng ?? _latLng,
        zoom: 19,
      );
}

class LocationManager {
  double? _lat;
  double? _lng;
  LatLng? _latLng;
  LatLng? get latLng => _latLng;
  final Box _userBox = Hive.box('users');

  bool _isLocationDefined = false;
  bool get isLocationDefined => _isLocationDefined;

  void initialize() {
    if (_userBox.isOpen) {
      if (!_userBox.containsKey('lat') && !_userBox.containsKey('lng')) {
        setLatLngToHive(_latLng ?? const LatLng(35, 32));
      }
      _getLatLngFromHive();
      if (_latLng != null && _latLng != const LatLng(0.0, 0.0)) {
        _isLocationDefined = true;
      }
    }

    print('Location status: $_isLocationDefined');
  }

  void _getLatLngFromHive() {
    _lat = _userBox.get('lat', defaultValue: 0.0);
    _lng = _userBox.get('lng', defaultValue: 0.0);
    _latLng = LatLng(_lat!, _lng!);
    print('getted LatLng from Hive : $latLng');
  }

  Future<void> setLatLngToHive(LatLng? latLng) async {
    if (latLng == null) {}
    if (latLng == const LatLng(0, 0)) {}
    print('setted LatLng to Hive : $latLng');

    await _userBox.put('lat', latLng?.latitude);
    await _userBox.put('lng', latLng?.longitude);
  }
}

class AddressManager {
  final LocationManager _locationManager;
  final GeocodingService _geocodingService;

  AddressManager(
      {required LocationManager locationManager,
      required GeocodingService geocodingService})
      : _locationManager = locationManager,
        _geocodingService = geocodingService;

  bool _isGeocodingDone = false;
  bool get isGeocodingDone => _isGeocodingDone;

  bool _isLoadedCurrentLatLng = false;
  bool get isLoadedCurrentLatLng => _isLoadedCurrentLatLng;

  List<Placemark> _placemarks = const <Placemark>[];
  List<Placemark> get placemarks => _placemarks;
  Placemark _placemark = Placemark();
  Placemark get placemark => _placemark;

  List<Location> _locations = const <Location>[];
  List<Location> get locations => _locations;

  Future<void> getCurrentLatLng(String? address) async {
    if (address == null) {}
    if (address!.isEmpty) {}
    Stream<List<Location>> streamLocations =
        _geocodingService.getCurrentLatLng(address);
    await for (List<Location?>? locations in streamLocations) {
      if (locations == null) {}
      if (locations!.isEmpty) {}
      _locations = List.from(locations);
      _isLoadedCurrentLatLng = true;
      print('locations = ' + _locations.toString());
    }
  }

  Future<void> getCurrentPlace() async {
    LatLng? _latLng = _locationManager.latLng;
    if (_latLng == null) {
      print('AddressManager getCurrentPlace() locationManager latLng Null');
    }
    if (_latLng == const LatLng(0, 0)) {
      print(
          'AddressManager getCurrentPlace() locationManager latLng = LatLng[0,0]');
    }
    Stream<List<Placemark>> streamPlacemarks =
        _geocodingService.getCurrentPlace(_latLng!);

    await for (List<Placemark?>? placemarks in streamPlacemarks) {
      if (placemarks == null) {
        throw ArgumentError(
            ['AddressManager getCurrentPlace() placemarks Null']);
      }
      if (placemarks.isEmpty) {
        throw ArgumentError(
            ['AddressManager getCurrentPlace() placemarks Empty']);
      }
      _placemarks = List.from(placemarks);

      _placemark = _placemarks.first;
      _isGeocodingDone = true;
    }
  }
}

//! fetch LatLng on device
class GeolocatorManager {
  GeolocatorManager(
      {required this.geolocatorService, required this.locationManager});
  final GeolocatorService geolocatorService;
  final LocationManager locationManager;

  bool _requestPermission = false;

  bool _isPositionNotNull = false;
  bool get isPositionNotNull => _isPositionNotNull;

  late Position _position;
  Position get position => _position;

  Future<void> initialize() async {
    await requestPermission();
    await getCurrentLocation();
    if (_isPositionNotNull) {
      await locationManager
          .setLatLngToHive(LatLng(_position.latitude, _position.longitude));
      print('GeolocatorManager.initialize() $position');
    }
  }

  Future<void> requestPermission() async {
    await geolocatorService.requestPermission().then(
      (bool serviceEnabled) {
        _requestPermission = serviceEnabled;
      },
    );
  }

  Future<void> getCurrentLocation() async {
    if (_requestPermission) {
      if (_isPositionNotNull) {}
      Stream<Position> streamPosition = geolocatorService.getCurrentLocation();
      await for (Position? position in streamPosition) {
        _isPositionNotNull = position != null;
        _position = position!;
      }
    }
  }
}

class GeolocatorService {
  bool _serviceEnabled = false;

  late LocationPermission _permission;

  Stream<Position> getCurrentLocation() {
    return Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high)
        .asStream();
  }

  Future<bool> requestPermission() async {
    _serviceEnabled = await Geolocator.isLocationServiceEnabled();

    if (!_serviceEnabled) {
      Geolocator.requestPermission();

      return Future.error('Location services are disabled.');
    }

    _permission = await Geolocator.checkPermission();

    if (_permission == LocationPermission.denied) {
      _permission = await Geolocator.requestPermission();

      if (_permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }

    if (_permission == LocationPermission.deniedForever) {
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }
    return _serviceEnabled;
  }
}
