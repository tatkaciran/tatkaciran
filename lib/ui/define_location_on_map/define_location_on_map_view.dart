// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:instajobs/config/config.dart';
import 'package:instajobs/config/managers/managers.dart';
import 'package:instajobs/constants/extensions/extensions.dart';

import 'package:provider/provider.dart';

import 'define_location_on_map.dart';

class DefineLocationOnMapView extends StatelessWidget {
  //! TODO: create find me button in map and when user click that button, update the camera position on where user current place in and set latlng,

  const DefineLocationOnMapView({Key? key}) : super(key: key);
  static MaterialPageRoute<void> route() => MaterialPageRoute(
        builder: (context) => DefineLocationOnMapView(),
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
    Size _deviceSize = context.deviceSize;
    return ChangeNotifierProvider<DefineLocationOnMapManager>.value(
      value: _defineLocationOnMapManager,
      child: Builder(builder: (context) {
        DefineLocationOnMapManager _manager =
            context.watch<DefineLocationOnMapManager>();

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
                const CenterMartker(),
                SaveCurrentLocationOnMapButtonView()
              ],
            ),
          ),
        );
      }),
    );
  }
}

class SaveCurrentLocationOnMapButtonView extends StatelessWidget {
  const SaveCurrentLocationOnMapButtonView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    DefineLocationOnMapManager _manager =
        context.watch<DefineLocationOnMapManager>();
    print('isCurrentLocationFind' + _manager.isCurrentLocationFind.toString());

    return Positioned(
      left: 10,
      right: 10,
      bottom: 10,
      child: Card(
        color: Colors.transparent,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            ElevatedButton(
              onPressed: () {
                _manager.locationManagerInitialize;
                //    context
                // .read<NavigationBloc>()
                // .add(const NavigationEvent.showChat(showChat));
              },
              child: const Text('Konumu Kaydet'),
            ),
            TextButton(
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
            ),
          ],
        ),
      ),
    );
  }
}

class CenterMartker extends StatelessWidget {
  const CenterMartker({
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
