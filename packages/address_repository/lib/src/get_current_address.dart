import 'models/models.dart';

abstract class GetCurrentAddress {
  Future<void> getCurrentAddress(LatLng latlng);
}
