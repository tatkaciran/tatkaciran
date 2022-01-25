part of 'geopoint_bloc.dart';

abstract class GeoPointEvent extends Equatable {
  const GeoPointEvent();
  @override
  List<Object> get props => [];
}

class LoadGeoPoint extends GeoPointEvent {
  final String uid;

  const LoadGeoPoint(this.uid);

  @override
  List<Object> get props => [uid];

  @override
  String toString() => 'LoadGeoPoint { id: $uid }';
}

class DeleteGeoPoint extends GeoPointEvent {
  final String uid;

  const DeleteGeoPoint(this.uid);

  @override
  List<Object> get props => [uid];

  @override
  String toString() => 'DeleteGeoPoint { uid: $uid }';
}

class UpdateGeoPoint extends GeoPointEvent {
  final String uid;
  final GeoPoint geoPoint;

  const UpdateGeoPoint(this.uid, this.geoPoint);

  @override
  List<Object> get props => [uid, geoPoint];

  @override
  String toString() => 'UpdateGeoPoint { uid: $uid, geoPoint: $geoPoint }';
}

class UpdatedGeoPoint extends GeoPointEvent {
  final GeoPoint geoPoint;

  const UpdatedGeoPoint(this.geoPoint);

  @override
  List<Object> get props => [geoPoint];

  @override
  String toString() => 'UpdatedGeoPoint { geoPoint: $geoPoint }';
}
