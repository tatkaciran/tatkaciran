import 'address_manager.dart';
import 'geocoding_get_current_latlng.dart';
import 'geocoding_get_current_address.dart';
import 'get_current_latlng.dart';
import 'get_current_address.dart';

class GeocodingAddressManager implements AddressManager {
  GeocodingAddressManager()
      : getCurrentLatLng = GeocodingGetCurrentLatLng(),
        getCurrentAddress = GeocodingGetCurrentAddress();

  @override
  GetCurrentLatLng getCurrentLatLng;

  @override
  GetCurrentAddress getCurrentAddress;
}
