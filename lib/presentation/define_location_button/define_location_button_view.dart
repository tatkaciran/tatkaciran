import 'package:location_picker_with_google_maps/location_picker_with_google_maps.dart';
import 'package:provider/provider.dart';

import '../../../../constants/constants.dart';
import '../../config/managers/managers.dart';
import 'define_location_button.dart';

class DefineLocationButton extends StatelessWidget {
  const DefineLocationButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    GeocodingService _geocodingService = GeocodingService();
    // GeolocatorService _geolocatorService = GeolocatorService();
    LocationManager _locationManager = LocationManager();
    AddressManager _addressManager = AddressManager(
      geocodingService: _geocodingService,
      locationManager: _locationManager,
    );
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => DefineLocationButtonManager(
            addressManager: _addressManager,
            locationManager: _locationManager,
          )..initialize(),
        ),
      ],
      child: Builder(
        builder: (context) {
          bool isLocationDefined =
              context.watch<DefineLocationButtonManager>().isLocationDefined;

          return Padding(
            padding: const EdgeInsets.only(left: 12.0, right: 12.0),
            child: (isLocationDefined)
                ? const DefinedLocationView()
                : const NoDefinedLocationView(),
          );
        },
      ),
    );
  }
}
