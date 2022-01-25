import 'get_current_latlng.dart';
import 'services/services.dart';

class GeocodingGetCurrentLatLng implements GetCurrentLatLng {
  GeocodingGetCurrentLatLng() : _geocodingService = GeocodingService();
  final GeocodingService _geocodingService;

  @override
  Future<void> getCurrentLatLng(String address) {
    // TODO: implement getCurrentLatLng
    throw UnimplementedError();
  }
}
