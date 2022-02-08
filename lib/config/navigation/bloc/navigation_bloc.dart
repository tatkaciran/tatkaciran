import 'package:instajobs/config/config.dart';

import '../../../ui/auth/auth.dart';

class NavigationBloc extends Bloc<NavigationEvent, NavigationState> {
  final Stream<AuthenticationState> _authenticationStream;
  NavigationBloc({required Stream<AuthenticationState> authenticationStream})
      : _authenticationStream = authenticationStream,
        super(const NavigationState()) {
    on<NavigationEvent>(
      (event, emit) async {
        await event.when(
          initialize: (bool isAuth) async {
            await _initializeApp(emit, state);
          },
          showChat: (bool showChat) async => emit(
            state.copyWith(isShowedChat: showChat),
          ),
          showAddJob: (bool showAddJob) async => emit(
            state.copyWith(isShowedAddJob: showAddJob),
          ),
          showOnboarding: (bool showOnboarding) async => emit(
            state.copyWith(isShowedOnboarding: showOnboarding),
          ),
          showProfile: (bool showProfile, String tab) async => emit(
            state.copyWith(
              isShowedProfile: showProfile,
              currentProfileTab: tab,
            ),
          ),
          showJobDetails: (bool showJobDetails) async => emit(
            state.copyWith(isShowedJobDetails: showJobDetails),
          ),
          showDefineLocation: (bool showDefineLocation) async => emit(
            state.copyWith(isLocationDefined: showDefineLocation),
          ),
          logout: () async {
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
            await _initializeApp(emit, state);
          },
        );
      },
    );
  }

  Future<void> _initializeApp(
      Emitter<NavigationState> emit, NavigationState state) async {
    await for (AuthenticationState auth in _authenticationStream) {
      if (auth.status == AuthenticationStatus.unauthenticated) {
        emit(state.copyWith(isInitialized: false));
      }
      if (auth.status == AuthenticationStatus.authenticated) {
        emit(state.copyWith(isInitialized: true, isLoggedIn: true));
      }
    }
  }
}
