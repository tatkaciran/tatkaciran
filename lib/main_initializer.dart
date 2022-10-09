import 'dart:io';

import 'package:address_repository/address_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:jobs_repository/jobs_repository.dart';
import 'package:path_provider/path_provider.dart';

import 'constants/constants.dart';
import 'presentation/auth/auth.dart';

late LocalJobsHiveDataSource<Job> localJobsHiveDataSource;
late LocalJobsMemoryDataSource<Job> localJobsMemoryDataSource;
late RemoteJobsFirebaseDataSource<Job> remoteJobsFirebaseDataSource;
late List<DataSource<Job>> jobsDataSources;
late AuthUser user;

class MainInitializer {
  _hiveInit() async {
    final Directory tempDir = await getApplicationDocumentsDirectory();
    final String _hiveTempPath = tempDir.path;
    await Hive.initFlutter(_hiveTempPath);
    await Hive.openBox('users');
    await localJobsHiveDataSource.ready();
  }

  _firebaseInit() async {
    await Firebase.initializeApp();
  }

  _geocodingInit() async {
    GeocodingGetCurrentAddress? geocodingGetCurrentAddress;
    await geocodingGetCurrentAddress?.getCurrentAddress(const LatLng(35, 32));
  }

  _jobsDataSourcesInit() {
    localJobsMemoryDataSource = LocalJobsMemoryDataSource<Job>();
    localJobsHiveDataSource = LocalJobsHiveDataSource<Job>(
      fromJson: (Map<String, dynamic> data) => Job.fromJson(data),
      toJson: (Job obj) => obj.toJson(),
    );
    remoteJobsFirebaseDataSource = RemoteJobsFirebaseDataSource<Job>();

    jobsDataSources = [
      localJobsMemoryDataSource,
      localJobsHiveDataSource,
      remoteJobsFirebaseDataSource,
    ];
  }

  Future<void> load() async {
    WidgetsFlutterBinding.ensureInitialized();
    await _firebaseInit();
    await _geocodingInit();
    _jobsDataSourcesInit();
    await _hiveInit();

    // SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky,
    //   overlays: [SystemUiOverlay.top]);

    // Bloc.observer = SimpleBlocObserver();}
    EquatableConfig.stringify = kDebugMode;
  }
}
