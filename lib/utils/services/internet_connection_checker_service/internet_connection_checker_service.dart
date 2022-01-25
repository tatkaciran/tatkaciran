import 'dart:async';

import 'package:connectivity/connectivity.dart';

class InternetConnection {
  bool _connectionStatus = false;
  bool get connectionStatus => _connectionStatus;
  final Connectivity _connectivity = Connectivity();

  Future<void> checkState() async {
    await for (ConnectivityResult result
        in _connectivity.onConnectivityChanged) {
      _updateConnectionStatus(result);
    }
  }

  Future<void> _updateConnectionStatus(ConnectivityResult result) async {
    switch (result) {
      case ConnectivityResult.wifi:
      case ConnectivityResult.mobile:
        _connectionStatus = true;

        break;
      case ConnectivityResult.none:
        _connectionStatus = false;
        break;
      default:
        _connectionStatus = false;
        break;
    }
  }
}
