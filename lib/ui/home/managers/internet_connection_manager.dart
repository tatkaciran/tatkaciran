import 'dart:async';

import 'package:instajobs/constants/constants.dart';
import 'package:instajobs/utils/services/services.dart';

class InternetConnectionManager {
  InternetConnection internetConnection = InternetConnection();

  late Stream<bool> internetConnectionStatusStream;

  void initializing() {
    internetConnection.checkState();
  }

  Future<void> internetConnectionStatus(BuildContext context) async {}
}
