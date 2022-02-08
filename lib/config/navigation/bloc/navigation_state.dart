import 'package:freezed_annotation/freezed_annotation.dart';

part 'navigation_state.freezed.dart';

@freezed
class NavigationState with _$NavigationState {
  const factory NavigationState({
    @Default(false) bool isLoggedIn,
    @Default(false) bool isInitialized,
    @Default(false) bool isShowedProfile,
    @Default('myjobs') String currentProfileTab,
    @Default(false) bool isShowedChat,
    @Default(false) bool isShowedAddJob,
    @Default(false) bool isShowedOnboarding,
    @Default(false) bool isLocationDefined,
    @Default(false) bool isShowedJobDetails,
  }) = _NavigationState;
}
