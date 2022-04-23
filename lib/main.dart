// ignore_for_file: avoid_print

import 'dart:async';
import 'dart:io';

import 'package:address_repository/address_repository.dart';
import 'package:authentication_repository/authentication_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:path_provider/path_provider.dart';

import 'app.dart';
import 'constants/constants.dart';

void main() async {
  await MainInitializer().load();

  runZonedGuarded(
      () => runApp(
            App(
              authenticationRepository: AuthenticationRepository(),
            ),
          ), (error, stackTrace) {
    print(error.toString());
    print(stackTrace.toString());
  });
}

class MainInitializer {
  Future<void> load() async {
    WidgetsFlutterBinding.ensureInitialized();
    GeocodingGetCurrentAddress? geocodingGetCurrentAddress;
    await geocodingGetCurrentAddress?.getCurrentAddress(LatLng(35, 32));

    // SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky,
    //   overlays: [SystemUiOverlay.top]);
    FlutterError.onError = (details) {
      print(details.exceptionAsString());
      print(details.stack.toString());
    };
    final Directory tempDir = await getApplicationDocumentsDirectory();
    final String _hiveTempPath = tempDir.path;
    await Hive.initFlutter(_hiveTempPath);
    await Hive.openBox('users');
    await Firebase.initializeApp();

    EquatableConfig.stringify = kDebugMode;
    // Bloc.observer = SimpleBlocObserver();}
  }
}
