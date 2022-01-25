import 'dart:async';

import 'package:instajobs/config/config.dart';
import 'package:instajobs/constants/constants.dart';
import 'package:instajobs/ui/auth/auth.dart';

class NavigationStateManager extends ChangeNotifier {
  late ChatManager _chatManager;
  late AppStateManager _appStateManager;
  ChatManager get chatManager => _chatManager;
  AppStateManager get appStateManager => _appStateManager;
  void setManagers({
    required ChatManager chatManager,
    required AppStateManager appStateManager,
  }) {
    _chatManager = chatManager;
    _appStateManager = appStateManager;
  }

  // final _appCache = AppCache();
  String _currentProfileTab = ProfileTab.myJobs;
  String get currentProfileTab => _currentProfileTab;
  void goToProfileTab(String tab) {
    _currentProfileTab = tab;
    _isShowingProfile = true;
    notifyListeners();
  }

  bool get isShowedChat => chatManager.isShowedChat;
  void showChat(bool value) {
    chatManager.showChat(value);
    _isShowingProfile = true;
    notifyListeners();
  }

  bool _isShowedAddJob = false;
  bool get isShowedAddJob => _isShowedAddJob;
  void showAddJob(bool value) {
    _isShowedAddJob = value;
    _isShowingProfile = true;
    notifyListeners();
  }

  bool _isInitialized = false;
  bool get isInitialized => _isInitialized;
  void initializeApp(BuildContext context) {
    Future(
      () {
        BlocProvider.of<AuthenticationBloc>(context, listen: false)
            .stream
            .forEach((AuthenticationState state) {
          if (state.status == AuthenticationStatus.unauthenticated) {
            _isloggedIn = false;
            _isHome = false;
          }
          if (state.status == AuthenticationStatus.authenticated) {
            _isloggedIn = true;
            _isHome = true;
          }

          notifyListeners();
        });
      },
    ).whenComplete(() {
      _isInitialized = true;
    });
  }

  bool _isOnboardingPath = false;
  bool get isOnboardingPath => _isOnboardingPath;
  void setOnboardingPath(bool value) {
    _isOnboardingPath = value;
    notifyListeners();
  }

  bool _isHome = false;
  bool get isHome => _isHome;
  void setHome(bool value) {
    _isHome = value;
    notifyListeners();
  }

  bool _isShowingProfile = false;
  bool get isShowedProfile => _isShowingProfile;
  void showProfile(bool value) {
    _isShowingProfile = value;
    notifyListeners();
  }

  bool _isLocationDefined = false;
  bool get isLocationDefined => _isLocationDefined;
  void locationStatus(bool value) {
    _isLocationDefined = value;
    notifyListeners();
  }

  bool _isloggedIn = false;
  bool get isloggedIn => _isloggedIn;
  void loginStatus(bool value) {
    _isloggedIn = value;
    notifyListeners();
  }

  void logout(BuildContext context) {
    _isInitialized = false;
    _isOnboardingPath = false;
    _isHome = false;
    _isShowingProfile = false;
    _isShowedAddJob = false;
    _isShowingProfile = false;
    chatManager.logout();
    appStateManager.logout();
    initializeApp(context);
    notifyListeners();
  }
}
