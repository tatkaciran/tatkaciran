import 'get_current_latlng.dart';
import 'get_current_address.dart';

abstract class AddressManager {
  late GetCurrentLatLng getCurrentLatLng;
  late GetCurrentAddress getCurrentAddress;
}
