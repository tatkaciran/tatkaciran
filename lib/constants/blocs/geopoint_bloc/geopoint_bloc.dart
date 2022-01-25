import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:geopoint_repository/geopoint_repository.dart';

part 'geopoint_event.dart';
part 'geopoint_state.dart';

class GeoPointBloc extends Bloc<GeoPointEvent, GeoPointState> {
  final GeoPointRepository _geoPointRepository;
  GeoPointBloc({required GeoPointRepository geoPointRepository})
      : _geoPointRepository = geoPointRepository,
        super(const GeoPointLoaded()) {
    on<LoadGeoPoint>(_onLoadGeoPoint);
    on<UpdatedGeoPoint>(_onUpdatedGeoPoint);
    on<UpdateGeoPoint>(_onUpdateGeoPoint);
    on<DeleteGeoPoint>(_onDeleteGeoPoint);
  }

  Future<void> _onLoadGeoPoint(
      LoadGeoPoint event, Emitter<GeoPointState> emit) async {
    Stream<GeoPoint> geoPointStream = _geoPointRepository.geoPoint();

    await for (GeoPoint geoPoint in geoPointStream) {
      add(UpdatedGeoPoint(geoPoint));
    }
  }

  void _onUpdatedGeoPoint(UpdatedGeoPoint event, Emitter<GeoPointState> emit) {
    emit(GeoPointLoaded(geoPoint: event.geoPoint));
  }

  void _onUpdateGeoPoint(UpdateGeoPoint event, Emitter<GeoPointState> emit) {
    _geoPointRepository.updateGeoPoint(geoPoint: event.geoPoint);
  }

  void _onDeleteGeoPoint(DeleteGeoPoint event, Emitter<GeoPointState> emit) {
    _geoPointRepository.deleteGeoPoint();
  }
}
