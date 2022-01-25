import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:geopoint_repository/geopoint_repository.dart';
import 'package:hive/hive.dart';

class HiveGeoPointRepository implements GeoPointRepository {
  final String _lat = 'lat';
  final String _lng = 'lng';
  Future<Box> userBox = Hive.openBox('users');

  @override
  Future<void> updateGeoPoint({required GeoPoint geoPoint}) async {
    Box box = await userBox;

    print('_hive geo point repository update ' +
        geoPoint.latitude.toString() +
        '  ' +
        geoPoint.longitude.toString());
    void _put() {
      box.put(_lat, geoPoint.latitude);
      box.put(_lng, geoPoint.longitude);
    }

    return _put();
  }

  @override
  Future<void> deleteGeoPoint() async {
    Box box = await userBox;
    void _delete() {
      box.delete(_lat);
      box.delete(_lng);
    }

    return _delete();
  }

  @override
  Stream<GeoPoint> geoPoint() async* {
    Box box = await userBox;
    double lat = box.get(_lat, defaultValue: 0.0);
    double lng = box.get(_lng, defaultValue: 0.0);

    GeoPoint geoPoint = GeoPoint(lat, lng);
    print('_hive geo point repository stream  ' +
        geoPoint.latitude.toString() +
        '  ' +
        geoPoint.longitude.toString());
    yield geoPoint;
  }
}
