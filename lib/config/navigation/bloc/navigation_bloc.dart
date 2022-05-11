import 'package:instajobs/config/config.dart';
import 'package:instajobs/main_initializer.dart';

import '../../../presentation/auth/auth.dart';

class NavigationCubit extends Cubit<NavigationState> {
  final Stream<AuthenticationState> _authenticationStream;
  NavigationCubit({required Stream<AuthenticationState> authenticationStream})
      : _authenticationStream = authenticationStream,
        super(const NavigationState());

  initialize(bool isAuth) async {
    await _initializeApp(state);
  }

  showChat(bool showChat) async => emit(
        state.copyWith(isShowedChat: showChat),
      );
  showAddJob(bool showAddJob) async => emit(
        state.copyWith(isShowedAddJob: showAddJob),
      );
  showOnboarding(bool showOnboarding) async => emit(
        state.copyWith(isShowedOnboarding: showOnboarding),
      );
  showProfile(bool showProfile, {String tab = 'myjobs'}) async => emit(
        state.copyWith(
          isShowedProfile: showProfile,
          currentProfileTab: tab,
        ),
      );
  showJobDetails(bool showJobDetails) async => emit(
        state.copyWith(isShowedJobDetails: showJobDetails),
      );
  showDefineLocation(bool showDefineLocation) async => emit(
        state.copyWith(isLocationDefined: showDefineLocation),
      );
  logout() async {
    emit(
      state.copyWith(
        isInitialized: false,
        isLocationDefined: false,
        isLoggedIn: false,
        isShowedAddJob: false,
        isShowedChat: false,
        isShowedJobDetails: false,
        isShowedOnboarding: false,
        isShowedProfile: false,
      ),
    );
    await _initializeApp(state);
  }

  Future<void> _initializeApp(NavigationState state) async {
    await for (AuthenticationState auth in _authenticationStream) {
      if (auth.status == AuthenticationStatus.unauthenticated) {
        emit(state.copyWith(isInitialized: true));
      }
      if (auth.status == AuthenticationStatus.authenticated) {
        user = auth.user;
        emit(state.copyWith(isInitialized: true, isLoggedIn: true));
      }
    }
  }
}
