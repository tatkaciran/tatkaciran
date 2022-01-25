import 'package:cloud_firestore/cloud_firestore.dart';

abstract class GeoPointRepository {
  Future<void> deleteGeoPoint();
  Future<void> updateGeoPoint({required GeoPoint geoPoint});
  Stream<GeoPoint> geoPoint();
}
