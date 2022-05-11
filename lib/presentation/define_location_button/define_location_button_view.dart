import 'package:location_picker_with_google_maps/location_picker_with_google_maps.dart';

import '../../../../constants/constants.dart';
import '../../config/managers/managers.dart';
import 'define_location_button.dart';

class DefineLocationButton extends StatelessWidget {
  const DefineLocationButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    GeocodingService _geocodingService = GeocodingService();
    LocationManager _locationManager = LocationManager();
    AddressManager _addressManager = AddressManager(
      geocodingService: _geocodingService,
      locationManager: _locationManager,
    );
    return DefineLocationButtonInit(
      addressManager: _addressManager,
      locationManager: _locationManager,
    );
  }
}

class DefineLocationButtonInit extends StatelessWidget {
  final LocationManager locationManager;
  final AddressManager addressManager;

  const DefineLocationButtonInit(
      {Key? key, required this.locationManager, required this.addressManager})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const DefineLocationButtonView(isLocationDefined: false);
  }
}

class DefineLocationButtonView extends StatelessWidget {
  final bool isLocationDefined;
  const DefineLocationButtonView({Key? key, this.isLocationDefined = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 12.0, right: 12.0),
      child: AnimatedCrossFade(
        crossFadeState: (isLocationDefined)
            ? CrossFadeState.showFirst
            : CrossFadeState.showSecond,
        duration: const Duration(seconds: 1),
        firstChild: const DefinedLocationView(isGeocodingDone: false),
        secondChild: const NoDefinedLocationView(),
      ),
    );
  }
}
