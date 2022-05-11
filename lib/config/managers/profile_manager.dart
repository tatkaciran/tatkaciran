import 'package:flutter/foundation.dart';
import 'package:instajobs/constants/constants.dart';
import 'package:instajobs/constants/models/models.dart';

class ProfileTab {
  static const String myJobs = 'myJobs';
  static const String messages = 'messages';
  static const String app = 'app';
}

class ProfileManager extends ChangeNotifier {
  User get getUser => User.empty.copyWith(darkMode: _darkMode);
  bool get didSelectUser => _didSelectUser;
  bool get darkMode => _darkMode;
  String get getSelectedTab => _selectedTab;

  var _didSelectUser = false;
  var _darkMode = false;
  String _selectedTab = ProfileTab.messages;
  set darkMode(bool darkMode) {
    _darkMode = darkMode;
    notifyListeners();
  }

  void goToTab(i) {
    _selectedTab = i;
    notifyListeners();
  }

  void goToJobs() {
    _selectedTab = ProfileTab.myJobs;
    notifyListeners();
  }

  void goToMessages() {
    _selectedTab = ProfileTab.messages;
    notifyListeners();
  }

  void goToApp() {
    _selectedTab = ProfileTab.app;
    notifyListeners();
  }

  void tapOnProfile(bool selected) {
    _didSelectUser = selected;
    notifyListeners();
  }
}
