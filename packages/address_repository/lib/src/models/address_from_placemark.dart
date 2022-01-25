import 'package:geocoding/geocoding.dart';

class AddressFromPlacemark {
  final Placemark placemark;

  AddressFromPlacemark(this.placemark) {
    if (placemark.administrativeArea!.isNotEmpty) {
      administrativeArea = '${placemark.administrativeArea} ';
    }
    if (placemark.country!.isNotEmpty) {
      country = '${placemark.country}, ';
    }
    if (placemark.isoCountryCode!.isNotEmpty) {
      isoCountryCode = '${placemark.isoCountryCode}, ';
    }
    if (placemark.locality!.isNotEmpty) {
      locality = '${placemark.locality}, ';
    }
    if (placemark.name!.isNotEmpty) {
      name = '${placemark.name}, ';
    }
    if (placemark.postalCode!.isNotEmpty) {
      postalCode = '${placemark.postalCode}, ';
    }
    if (placemark.street!.isNotEmpty) {
      street = '${placemark.street}, ';
    }
    if (placemark.subAdministrativeArea!.isNotEmpty) {
      subAdministrativeArea = '${placemark.subAdministrativeArea} ';
    }
    if (placemark.subLocality!.isNotEmpty) {
      subLocality = '${placemark.subLocality}, ';
    }
    if (placemark.subThoroughfare!.isNotEmpty) {
      subThoroughfare = '${placemark.subThoroughfare}, ';
    }
    if (placemark.thoroughfare!.isNotEmpty) {
      thoroughfare = '${placemark.thoroughfare}, ';
    }
  }

  String name = '';
  String isoCountryCode = '';
  String country = '';
  String postalCode = '';
  String administrativeArea = '';
  String subAdministrativeArea = '';
  String locality = '';
  String subLocality = '';
  String thoroughfare = '';
  String subThoroughfare = '';
  String street = '';

  String address1() {
    return '$street$subAdministrativeArea';
  }

  String shortAddress1() {
    return '$street, $subAdministrativeArea';
  }
}
