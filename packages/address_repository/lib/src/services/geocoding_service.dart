import 'package:address_repository/src/models/models.dart';
import 'package:geocoding/geocoding.dart';

class GeocodingService {
  Stream<List<Placemark>> getCurrentPlace(LatLng latLng) {
    if (latLng == LatLng(0, 0)) {
      print('GeocodingService getCurrentPlace() LatLng is LatLng(0,0)');
    }
    return placemarkFromCoordinates(latLng.latitude, latLng.longitude)
        .asStream();
  }

  Stream<List<Location>> getCurrentLatLng(String address) {
    if (address.isEmpty) {
      print('GeocodingService getCurrentLatLng() address is empty');
    }
    return locationFromAddress(address).asStream();
  }
}
