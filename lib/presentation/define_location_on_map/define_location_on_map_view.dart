// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:instajobs/config/config.dart';
import 'package:instajobs/config/managers/managers.dart';
import 'package:instajobs/constants/extensions/extensions.dart';

import 'package:provider/provider.dart';

import 'define_location_on_map.dart';

class DefineLocationOnMap extends StatelessWidget {
  const DefineLocationOnMap({Key? key}) : super(key: key);
  static MaterialPageRoute<void> route() => MaterialPageRoute(
        builder: (c) => DefineLocationOnMap(),
      );

  @override
  Widget build(BuildContext context) {
    LocationManager _locationManager = LocationManager();
    GoogleMapManager _googleMapManager = GoogleMapManager(_locationManager);
    GeolocatorService _geolocatorService = GeolocatorService();
    GeolocatorManager _geolocatorManager = GeolocatorManager(
      geolocatorService: _geolocatorService,
      locationManager: _locationManager,
    );
    DefineLocationOnMapManager _defineLocationOnMapManager =
        DefineLocationOnMapManager(
      locationManager: _locationManager,
      googleMapManager: _googleMapManager,
      geolocatorManager: _geolocatorManager,
    );

    /// DEVICE SIZE

    return DefineLocationOnMapInit(
      defineLocationOnMapManager: _defineLocationOnMapManager,
    );
  }
}

class DefineLocationOnMapInit extends StatelessWidget {
  final DefineLocationOnMapManager defineLocationOnMapManager;
  const DefineLocationOnMapInit(
      {Key? key, required this.defineLocationOnMapManager})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<DefineLocationOnMapManager>(
      create: (context) => defineLocationOnMapManager,
      child: DefineLocationOnMapView(),
    );
  }
}

class DefineLocationOnMapView extends StatelessWidget {
  const DefineLocationOnMapView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    DefineLocationOnMapManager _manager =
        context.watch<DefineLocationOnMapManager>();
    Size _deviceSize = context.deviceSize;
    return Scaffold(
      body: SizedBox(
        height: _deviceSize.height,
        width: _deviceSize.width,
        child: Stack(
          children: [
            GoogleMap(
              mapType: MapType.hybrid,
              mapToolbarEnabled: false,
              zoomControlsEnabled: false,
              initialCameraPosition: _manager.initialCameraPosition,
              onMapCreated: _manager.onMapCreated,
              onCameraIdle: _manager.pickLocationOnMap,
            ),
            const CenterMarker(),
            DefineLocationOnMapBottomBar()
          ],
        ),
      ),
    );
  }
}

class DefineLocationOnMapBottomBar extends StatelessWidget {
  const DefineLocationOnMapBottomBar({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    DefineLocationOnMapManager _manager =
        context.watch<DefineLocationOnMapManager>();

    return Positioned(
      left: 10,
      right: 10,
      bottom: 10,
      child: Card(
        color: Colors.transparent,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _SaveCurrentLatLngButton(manager: _manager),
            _FindMeButton(manager: _manager),
          ],
        ),
      ),
    );
  }
}

class _FindMeButton extends StatelessWidget {
  const _FindMeButton({
    Key? key,
    required DefineLocationOnMapManager manager,
  })  : _manager = manager,
        super(key: key);

  final DefineLocationOnMapManager _manager;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: TextButton.styleFrom(
        backgroundColor: context.theme.buttonTheme.colorScheme?.primary,
      ),
      onPressed: () async {
        await _manager.setCurrentLocationFind();
      },
      child: Row(
        children: [
          _manager.isCurrentLocationFind
              ? Text(
                  'Aranıyor...',
                  style: context.theme.textTheme.bodyText1,
                )
              : Text(
                  'Beni bul',
                  style: context.theme.textTheme.bodyText1,
                ),
          Center(
            child: _manager.isCurrentLocationFind
                ? CircularProgressIndicator(
                    color: context.theme.textTheme.bodyText1?.color,
                  )
                : Icon(
                    Icons.location_searching,
                    color: Theme.of(context).textTheme.bodyText1?.color,
                    size: 30,
                  ),
          ),
        ],
      ),
    );
  }
}

class _SaveCurrentLatLngButton extends StatelessWidget {
  const _SaveCurrentLatLngButton({
    Key? key,
    required DefineLocationOnMapManager manager,
  })  : _manager = manager,
        super(key: key);

  final DefineLocationOnMapManager _manager;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        _manager.locationManagerInitialize;

        Navigator.pop(context);
      },
      child: const Text('Konumu Kaydet'),
    );
  }
}

class CenterMarker extends StatelessWidget {
  const CenterMarker({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          Icon(
            Icons.location_on,
            size: 50,
            color: Colors.red,
          ),
          SizedBox(
            height: 42,
          )
        ],
      ),
    );
  }
}
