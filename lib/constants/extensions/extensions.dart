import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../l10n/l10n.dart';

extension LatLngX on LatLng {
  GeoPoint get toGeoPoint => GeoPoint(latitude, longitude);
}

extension DeviceSizeX on BuildContext {
  Size get deviceSize => MediaQuery.of(this).size;
}

extension MediaQueryX on BuildContext {
  MediaQueryData get mediaQuery => MediaQuery.of(this);
}

extension ThemeX on BuildContext {
  ThemeData get theme => Theme.of(this);
}

// String Extention for get images from assets
extension StringX on String {
  String get xImagesPath => 'assets/images/$this.png';
  String get xRoutePath => '/$this';
  // String get xSoundsPath => 'assets/sounds/$this.mp3';
  // String get xFontPath => 'assets/fonts/$this.ttf';
  // String get xError => 'an error occurred in the $this';
  // String get xImagesPathSvg => 'assets/images/$this.svg';
  // String get xLogosPath => 'assets/logo/$this.png';
}

extension AppLocalizationsX on BuildContext {
  AppLocalizations? get l10n => AppLocalizations.of(this);
}
