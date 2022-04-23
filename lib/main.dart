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
import 'package:jobs_repository/jobs_repository.dart';
import 'package:path_provider/path_provider.dart';

import 'app.dart';
import 'constants/constants.dart';

late LocalJobsHiveDataSource<Job> localJobsHiveDataSource;
late LocalJobsMemoryDataSource<Job> localJobsMemoryDataSource;
late RemoteJobsFirebaseDataSource<Job> remoteJobsFirebaseDataSource;
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
    await Firebase.initializeApp();
    GeocodingGetCurrentAddress? geocodingGetCurrentAddress;
    await geocodingGetCurrentAddress?.getCurrentAddress(LatLng(35, 32));
    localJobsMemoryDataSource = LocalJobsMemoryDataSource<Job>();
    localJobsHiveDataSource = LocalJobsHiveDataSource<Job>(
      fromJson: (Map<String, dynamic> data) => Job.fromJson(data),
      toJson: (Job obj) => obj.toJson(),
    );
    remoteJobsFirebaseDataSource = RemoteJobsFirebaseDataSource<Job>();

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
    await localJobsHiveDataSource.ready();

    EquatableConfig.stringify = kDebugMode;
    // Bloc.observer = SimpleBlocObserver();}
  }
}
