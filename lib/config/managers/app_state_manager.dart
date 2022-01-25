import 'package:flutter/foundation.dart';
import 'package:instajobs/config/app_cache.dart';
import 'package:instajobs/constants/constants.dart';

class AppStateManager extends ChangeNotifier {
  bool _onboardingComplete = false;
  final _appCache = AppCache();

  bool get isOnboardingComplete => _onboardingComplete;

  void login(String username, String password) async {
    // _loggedIn = true;
    await _appCache.cacheUser();
    notifyListeners();
  }

  void completeOnboarding() {
    _onboardingComplete = true;
    notifyListeners();
  }

  void logout() async {
    // _loggedIn = false;
    _onboardingComplete = false;

    await _appCache.invalidate();

    notifyListeners();
  }
}
