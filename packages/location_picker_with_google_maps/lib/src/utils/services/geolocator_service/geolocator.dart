import 'package:flutter/cupertino.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class GeolocatorService extends ChangeNotifier {
  late bool _serviceEnabled;
  late LocationPermission _permission;

  bool _positionIsNotNull = false;
  bool get positionIsNotNull => _positionIsNotNull;
  LatLng _latlng = const LatLng(0, 0);
  LatLng get latlng => _latlng;
  Position? _position;
  Position? get position => _position;
  void getCurrentLocation() async {
    _serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!_serviceEnabled) {
      Geolocator.requestPermission();
      notifyListeners();
      return Future.error('Location services are disabled.');
    }

    _permission = await Geolocator.checkPermission();

    if (_permission == LocationPermission.denied) {
      _permission = await Geolocator.requestPermission();

      if (_permission == LocationPermission.denied) {
        notifyListeners();
        return Future.error('Location permissions are denied');
      }
      notifyListeners();
    }

    if (_permission == LocationPermission.deniedForever) {
      notifyListeners();
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }
    Stream<Position> streamPosition =
        Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high)
            .asStream();
    await for (Position position in streamPosition) {
      _position = position;
      if (_position != null) {
        _latlng = LatLng(position.latitude, position.longitude);
        _positionIsNotNull = true;
        print('position is not null: $_positionIsNotNull');
        print('position: $_position');
        print('latlng: $_latlng');
        notifyListeners();
      }
    }
  }
}
