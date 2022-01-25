part of 'geopoint_bloc.dart';

abstract class GeoPointState extends Equatable {
  const GeoPointState();

  @override
  List<Object> get props => [];
}

class GeoPointLoading extends GeoPointState {}

class GeoPointLoaded extends GeoPointState {
  final GeoPoint geoPoint;

  const GeoPointLoaded({this.geoPoint = const GeoPoint(0, 0)});

  @override
  List<Object> get props => [geoPoint];

  @override
  String toString() => 'GeoPointLoaded { geoPoint: $geoPoint }';
}

class GeoPointNotLoaded extends GeoPointState {}
