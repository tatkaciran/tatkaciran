import 'package:freezed_annotation/freezed_annotation.dart';

part 'navigation_event.freezed.dart';

@freezed
class NavigationEvent with _$NavigationEvent {
  const NavigationEvent._();

  const factory NavigationEvent.initialize(bool isAuth) = Initialize;
  const factory NavigationEvent.showChat(bool showChat) = ShowChat;
  const factory NavigationEvent.showAddJob(bool showAddJob) = ShowAddJob;
  const factory NavigationEvent.showOnboarding(bool showOnboarding) =
      ShowOnboarding;
  const factory NavigationEvent.showProfile(bool showProfile,
      {@Default('myjobs') String tab}) = ShowProfile;
  const factory NavigationEvent.showJobDetails(bool showJobDetails) =
      ShowJobDetails;
  const factory NavigationEvent.showDefineLocation(bool showDefineLocation) =
      ShowDefineLocation;
  const factory NavigationEvent.logout() = Logout;
}
