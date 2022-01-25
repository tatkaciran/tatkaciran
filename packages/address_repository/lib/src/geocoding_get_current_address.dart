import 'package:geocoding/geocoding.dart';

import 'get_current_address.dart';
import 'models/models.dart';
import 'services/services.dart';

class GeocodingGetCurrentAddress implements GetCurrentAddress {
  GeocodingGetCurrentAddress() : _geocodingService = GeocodingService();
  final GeocodingService _geocodingService;

  late LatLng _latlng;

  late Stream<List<Placemark>> _streamPlacemarks;

  List<Placemark> _placemarks = const <Placemark>[];
  Placemark? _placemark;

  late AddressFromPlacemark address;

  bool _isGetAddressDone = false;

  bool get isGetAddressDone => _isGetAddressDone;

  bool get _isLatLngZero => _latlng == LatLng(0, 0);

  @override
  Future<void> getCurrentAddress(LatLng latlng) async {
    _latlng = latlng;

    if (!_isLatLngZero) {
      await _getLatLngToStreamPlacemarks();
    }
  }

  Future<void> _getLatLngToStreamPlacemarks() async {
    _streamPlacemarks = _geocodingService.getCurrentPlace(_latlng);

    await for (List<Placemark?>? placemarks in _streamPlacemarks) {
      if (placemarks != null) {
        if (placemarks.isNotEmpty) {
          _placemarks = List.from(placemarks);
          _getAddress();
        }
      }
    }
  }

  void _getAddress() {
    _placemark = _placemarks.first;
    if (_placemark != null) {
      address = AddressFromPlacemark(_placemark!);

      _isGetAddressDone = true;
    }
  }
}
