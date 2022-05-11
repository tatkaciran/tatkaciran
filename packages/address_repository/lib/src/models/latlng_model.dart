/// Coordinates in Degrees.
class LatLng {
  final double latitude;
  final double longitude;

  const LatLng(this.latitude, this.longitude);

  const LatLng.zero()
      : latitude = 0,
        longitude = 0;
}
