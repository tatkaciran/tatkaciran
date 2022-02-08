// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'navigation_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$NavigationEventTearOff {
  const _$NavigationEventTearOff();

  Initialize initialize(bool isAuth) {
    return Initialize(
      isAuth,
    );
  }

  ShowChat showChat(bool showChat) {
    return ShowChat(
      showChat,
    );
  }

  ShowAddJob showAddJob(bool showAddJob) {
    return ShowAddJob(
      showAddJob,
    );
  }

  ShowOnboarding showOnboarding(bool showOnboarding) {
    return ShowOnboarding(
      showOnboarding,
    );
  }

  ShowProfile showProfile(bool showProfile, {String tab = 'myjobs'}) {
    return ShowProfile(
      showProfile,
      tab: tab,
    );
  }

  ShowJobDetails showJobDetails(bool showJobDetails) {
    return ShowJobDetails(
      showJobDetails,
    );
  }

  ShowDefineLocation showDefineLocation(bool showDefineLocation) {
    return ShowDefineLocation(
      showDefineLocation,
    );
  }

  Logout logout() {
    return const Logout();
  }
}

/// @nodoc
const $NavigationEvent = _$NavigationEventTearOff();

/// @nodoc
mixin _$NavigationEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(bool isAuth) initialize,
    required TResult Function(bool showChat) showChat,
    required TResult Function(bool showAddJob) showAddJob,
    required TResult Function(bool showOnboarding) showOnboarding,
    required TResult Function(bool showProfile, String tab) showProfile,
    required TResult Function(bool showJobDetails) showJobDetails,
    required TResult Function(bool showDefineLocation) showDefineLocation,
    required TResult Function() logout,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(bool isAuth)? initialize,
    TResult Function(bool showChat)? showChat,
    TResult Function(bool showAddJob)? showAddJob,
    TResult Function(bool showOnboarding)? showOnboarding,
    TResult Function(bool showProfile, String tab)? showProfile,
    TResult Function(bool showJobDetails)? showJobDetails,
    TResult Function(bool showDefineLocation)? showDefineLocation,
    TResult Function()? logout,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(bool isAuth)? initialize,
    TResult Function(bool showChat)? showChat,
    TResult Function(bool showAddJob)? showAddJob,
    TResult Function(bool showOnboarding)? showOnboarding,
    TResult Function(bool showProfile, String tab)? showProfile,
    TResult Function(bool showJobDetails)? showJobDetails,
    TResult Function(bool showDefineLocation)? showDefineLocation,
    TResult Function()? logout,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Initialize value) initialize,
    required TResult Function(ShowChat value) showChat,
    required TResult Function(ShowAddJob value) showAddJob,
    required TResult Function(ShowOnboarding value) showOnboarding,
    required TResult Function(ShowProfile value) showProfile,
    required TResult Function(ShowJobDetails value) showJobDetails,
    required TResult Function(ShowDefineLocation value) showDefineLocation,
    required TResult Function(Logout value) logout,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(Initialize value)? initialize,
    TResult Function(ShowChat value)? showChat,
    TResult Function(ShowAddJob value)? showAddJob,
    TResult Function(ShowOnboarding value)? showOnboarding,
    TResult Function(ShowProfile value)? showProfile,
    TResult Function(ShowJobDetails value)? showJobDetails,
    TResult Function(ShowDefineLocation value)? showDefineLocation,
    TResult Function(Logout value)? logout,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Initialize value)? initialize,
    TResult Function(ShowChat value)? showChat,
    TResult Function(ShowAddJob value)? showAddJob,
    TResult Function(ShowOnboarding value)? showOnboarding,
    TResult Function(ShowProfile value)? showProfile,
    TResult Function(ShowJobDetails value)? showJobDetails,
    TResult Function(ShowDefineLocation value)? showDefineLocation,
    TResult Function(Logout value)? logout,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NavigationEventCopyWith<$Res> {
  factory $NavigationEventCopyWith(
          NavigationEvent value, $Res Function(NavigationEvent) then) =
      _$NavigationEventCopyWithImpl<$Res>;
}

/// @nodoc
class _$NavigationEventCopyWithImpl<$Res>
    implements $NavigationEventCopyWith<$Res> {
  _$NavigationEventCopyWithImpl(this._value, this._then);

  final NavigationEvent _value;
  // ignore: unused_field
  final $Res Function(NavigationEvent) _then;
}

/// @nodoc
abstract class $InitializeCopyWith<$Res> {
  factory $InitializeCopyWith(
          Initialize value, $Res Function(Initialize) then) =
      _$InitializeCopyWithImpl<$Res>;
  $Res call({bool isAuth});
}

/// @nodoc
class _$InitializeCopyWithImpl<$Res> extends _$NavigationEventCopyWithImpl<$Res>
    implements $InitializeCopyWith<$Res> {
  _$InitializeCopyWithImpl(Initialize _value, $Res Function(Initialize) _then)
      : super(_value, (v) => _then(v as Initialize));

  @override
  Initialize get _value => super._value as Initialize;

  @override
  $Res call({
    Object? isAuth = freezed,
  }) {
    return _then(Initialize(
      isAuth == freezed
          ? _value.isAuth
          : isAuth // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$Initialize extends Initialize {
  const _$Initialize(this.isAuth) : super._();

  @override
  final bool isAuth;

  @override
  String toString() {
    return 'NavigationEvent.initialize(isAuth: $isAuth)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is Initialize &&
            const DeepCollectionEquality().equals(other.isAuth, isAuth));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(isAuth));

  @JsonKey(ignore: true)
  @override
  $InitializeCopyWith<Initialize> get copyWith =>
      _$InitializeCopyWithImpl<Initialize>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(bool isAuth) initialize,
    required TResult Function(bool showChat) showChat,
    required TResult Function(bool showAddJob) showAddJob,
    required TResult Function(bool showOnboarding) showOnboarding,
    required TResult Function(bool showProfile, String tab) showProfile,
    required TResult Function(bool showJobDetails) showJobDetails,
    required TResult Function(bool showDefineLocation) showDefineLocation,
    required TResult Function() logout,
  }) {
    return initialize(isAuth);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(bool isAuth)? initialize,
    TResult Function(bool showChat)? showChat,
    TResult Function(bool showAddJob)? showAddJob,
    TResult Function(bool showOnboarding)? showOnboarding,
    TResult Function(bool showProfile, String tab)? showProfile,
    TResult Function(bool showJobDetails)? showJobDetails,
    TResult Function(bool showDefineLocation)? showDefineLocation,
    TResult Function()? logout,
  }) {
    return initialize?.call(isAuth);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(bool isAuth)? initialize,
    TResult Function(bool showChat)? showChat,
    TResult Function(bool showAddJob)? showAddJob,
    TResult Function(bool showOnboarding)? showOnboarding,
    TResult Function(bool showProfile, String tab)? showProfile,
    TResult Function(bool showJobDetails)? showJobDetails,
    TResult Function(bool showDefineLocation)? showDefineLocation,
    TResult Function()? logout,
    required TResult orElse(),
  }) {
    if (initialize != null) {
      return initialize(isAuth);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Initialize value) initialize,
    required TResult Function(ShowChat value) showChat,
    required TResult Function(ShowAddJob value) showAddJob,
    required TResult Function(ShowOnboarding value) showOnboarding,
    required TResult Function(ShowProfile value) showProfile,
    required TResult Function(ShowJobDetails value) showJobDetails,
    required TResult Function(ShowDefineLocation value) showDefineLocation,
    required TResult Function(Logout value) logout,
  }) {
    return initialize(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(Initialize value)? initialize,
    TResult Function(ShowChat value)? showChat,
    TResult Function(ShowAddJob value)? showAddJob,
    TResult Function(ShowOnboarding value)? showOnboarding,
    TResult Function(ShowProfile value)? showProfile,
    TResult Function(ShowJobDetails value)? showJobDetails,
    TResult Function(ShowDefineLocation value)? showDefineLocation,
    TResult Function(Logout value)? logout,
  }) {
    return initialize?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Initialize value)? initialize,
    TResult Function(ShowChat value)? showChat,
    TResult Function(ShowAddJob value)? showAddJob,
    TResult Function(ShowOnboarding value)? showOnboarding,
    TResult Function(ShowProfile value)? showProfile,
    TResult Function(ShowJobDetails value)? showJobDetails,
    TResult Function(ShowDefineLocation value)? showDefineLocation,
    TResult Function(Logout value)? logout,
    required TResult orElse(),
  }) {
    if (initialize != null) {
      return initialize(this);
    }
    return orElse();
  }
}

abstract class Initialize extends NavigationEvent {
  const factory Initialize(bool isAuth) = _$Initialize;
  const Initialize._() : super._();

  bool get isAuth;
  @JsonKey(ignore: true)
  $InitializeCopyWith<Initialize> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ShowChatCopyWith<$Res> {
  factory $ShowChatCopyWith(ShowChat value, $Res Function(ShowChat) then) =
      _$ShowChatCopyWithImpl<$Res>;
  $Res call({bool showChat});
}

/// @nodoc
class _$ShowChatCopyWithImpl<$Res> extends _$NavigationEventCopyWithImpl<$Res>
    implements $ShowChatCopyWith<$Res> {
  _$ShowChatCopyWithImpl(ShowChat _value, $Res Function(ShowChat) _then)
      : super(_value, (v) => _then(v as ShowChat));

  @override
  ShowChat get _value => super._value as ShowChat;

  @override
  $Res call({
    Object? showChat = freezed,
  }) {
    return _then(ShowChat(
      showChat == freezed
          ? _value.showChat
          : showChat // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$ShowChat extends ShowChat {
  const _$ShowChat(this.showChat) : super._();

  @override
  final bool showChat;

  @override
  String toString() {
    return 'NavigationEvent.showChat(showChat: $showChat)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ShowChat &&
            const DeepCollectionEquality().equals(other.showChat, showChat));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(showChat));

  @JsonKey(ignore: true)
  @override
  $ShowChatCopyWith<ShowChat> get copyWith =>
      _$ShowChatCopyWithImpl<ShowChat>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(bool isAuth) initialize,
    required TResult Function(bool showChat) showChat,
    required TResult Function(bool showAddJob) showAddJob,
    required TResult Function(bool showOnboarding) showOnboarding,
    required TResult Function(bool showProfile, String tab) showProfile,
    required TResult Function(bool showJobDetails) showJobDetails,
    required TResult Function(bool showDefineLocation) showDefineLocation,
    required TResult Function() logout,
  }) {
    return showChat(this.showChat);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(bool isAuth)? initialize,
    TResult Function(bool showChat)? showChat,
    TResult Function(bool showAddJob)? showAddJob,
    TResult Function(bool showOnboarding)? showOnboarding,
    TResult Function(bool showProfile, String tab)? showProfile,
    TResult Function(bool showJobDetails)? showJobDetails,
    TResult Function(bool showDefineLocation)? showDefineLocation,
    TResult Function()? logout,
  }) {
    return showChat?.call(this.showChat);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(bool isAuth)? initialize,
    TResult Function(bool showChat)? showChat,
    TResult Function(bool showAddJob)? showAddJob,
    TResult Function(bool showOnboarding)? showOnboarding,
    TResult Function(bool showProfile, String tab)? showProfile,
    TResult Function(bool showJobDetails)? showJobDetails,
    TResult Function(bool showDefineLocation)? showDefineLocation,
    TResult Function()? logout,
    required TResult orElse(),
  }) {
    if (showChat != null) {
      return showChat(this.showChat);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Initialize value) initialize,
    required TResult Function(ShowChat value) showChat,
    required TResult Function(ShowAddJob value) showAddJob,
    required TResult Function(ShowOnboarding value) showOnboarding,
    required TResult Function(ShowProfile value) showProfile,
    required TResult Function(ShowJobDetails value) showJobDetails,
    required TResult Function(ShowDefineLocation value) showDefineLocation,
    required TResult Function(Logout value) logout,
  }) {
    return showChat(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(Initialize value)? initialize,
    TResult Function(ShowChat value)? showChat,
    TResult Function(ShowAddJob value)? showAddJob,
    TResult Function(ShowOnboarding value)? showOnboarding,
    TResult Function(ShowProfile value)? showProfile,
    TResult Function(ShowJobDetails value)? showJobDetails,
    TResult Function(ShowDefineLocation value)? showDefineLocation,
    TResult Function(Logout value)? logout,
  }) {
    return showChat?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Initialize value)? initialize,
    TResult Function(ShowChat value)? showChat,
    TResult Function(ShowAddJob value)? showAddJob,
    TResult Function(ShowOnboarding value)? showOnboarding,
    TResult Function(ShowProfile value)? showProfile,
    TResult Function(ShowJobDetails value)? showJobDetails,
    TResult Function(ShowDefineLocation value)? showDefineLocation,
    TResult Function(Logout value)? logout,
    required TResult orElse(),
  }) {
    if (showChat != null) {
      return showChat(this);
    }
    return orElse();
  }
}

abstract class ShowChat extends NavigationEvent {
  const factory ShowChat(bool showChat) = _$ShowChat;
  const ShowChat._() : super._();

  bool get showChat;
  @JsonKey(ignore: true)
  $ShowChatCopyWith<ShowChat> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ShowAddJobCopyWith<$Res> {
  factory $ShowAddJobCopyWith(
          ShowAddJob value, $Res Function(ShowAddJob) then) =
      _$ShowAddJobCopyWithImpl<$Res>;
  $Res call({bool showAddJob});
}

/// @nodoc
class _$ShowAddJobCopyWithImpl<$Res> extends _$NavigationEventCopyWithImpl<$Res>
    implements $ShowAddJobCopyWith<$Res> {
  _$ShowAddJobCopyWithImpl(ShowAddJob _value, $Res Function(ShowAddJob) _then)
      : super(_value, (v) => _then(v as ShowAddJob));

  @override
  ShowAddJob get _value => super._value as ShowAddJob;

  @override
  $Res call({
    Object? showAddJob = freezed,
  }) {
    return _then(ShowAddJob(
      showAddJob == freezed
          ? _value.showAddJob
          : showAddJob // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$ShowAddJob extends ShowAddJob {
  const _$ShowAddJob(this.showAddJob) : super._();

  @override
  final bool showAddJob;

  @override
  String toString() {
    return 'NavigationEvent.showAddJob(showAddJob: $showAddJob)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ShowAddJob &&
            const DeepCollectionEquality()
                .equals(other.showAddJob, showAddJob));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(showAddJob));

  @JsonKey(ignore: true)
  @override
  $ShowAddJobCopyWith<ShowAddJob> get copyWith =>
      _$ShowAddJobCopyWithImpl<ShowAddJob>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(bool isAuth) initialize,
    required TResult Function(bool showChat) showChat,
    required TResult Function(bool showAddJob) showAddJob,
    required TResult Function(bool showOnboarding) showOnboarding,
    required TResult Function(bool showProfile, String tab) showProfile,
    required TResult Function(bool showJobDetails) showJobDetails,
    required TResult Function(bool showDefineLocation) showDefineLocation,
    required TResult Function() logout,
  }) {
    return showAddJob(this.showAddJob);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(bool isAuth)? initialize,
    TResult Function(bool showChat)? showChat,
    TResult Function(bool showAddJob)? showAddJob,
    TResult Function(bool showOnboarding)? showOnboarding,
    TResult Function(bool showProfile, String tab)? showProfile,
    TResult Function(bool showJobDetails)? showJobDetails,
    TResult Function(bool showDefineLocation)? showDefineLocation,
    TResult Function()? logout,
  }) {
    return showAddJob?.call(this.showAddJob);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(bool isAuth)? initialize,
    TResult Function(bool showChat)? showChat,
    TResult Function(bool showAddJob)? showAddJob,
    TResult Function(bool showOnboarding)? showOnboarding,
    TResult Function(bool showProfile, String tab)? showProfile,
    TResult Function(bool showJobDetails)? showJobDetails,
    TResult Function(bool showDefineLocation)? showDefineLocation,
    TResult Function()? logout,
    required TResult orElse(),
  }) {
    if (showAddJob != null) {
      return showAddJob(this.showAddJob);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Initialize value) initialize,
    required TResult Function(ShowChat value) showChat,
    required TResult Function(ShowAddJob value) showAddJob,
    required TResult Function(ShowOnboarding value) showOnboarding,
    required TResult Function(ShowProfile value) showProfile,
    required TResult Function(ShowJobDetails value) showJobDetails,
    required TResult Function(ShowDefineLocation value) showDefineLocation,
    required TResult Function(Logout value) logout,
  }) {
    return showAddJob(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(Initialize value)? initialize,
    TResult Function(ShowChat value)? showChat,
    TResult Function(ShowAddJob value)? showAddJob,
    TResult Function(ShowOnboarding value)? showOnboarding,
    TResult Function(ShowProfile value)? showProfile,
    TResult Function(ShowJobDetails value)? showJobDetails,
    TResult Function(ShowDefineLocation value)? showDefineLocation,
    TResult Function(Logout value)? logout,
  }) {
    return showAddJob?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Initialize value)? initialize,
    TResult Function(ShowChat value)? showChat,
    TResult Function(ShowAddJob value)? showAddJob,
    TResult Function(ShowOnboarding value)? showOnboarding,
    TResult Function(ShowProfile value)? showProfile,
    TResult Function(ShowJobDetails value)? showJobDetails,
    TResult Function(ShowDefineLocation value)? showDefineLocation,
    TResult Function(Logout value)? logout,
    required TResult orElse(),
  }) {
    if (showAddJob != null) {
      return showAddJob(this);
    }
    return orElse();
  }
}

abstract class ShowAddJob extends NavigationEvent {
  const factory ShowAddJob(bool showAddJob) = _$ShowAddJob;
  const ShowAddJob._() : super._();

  bool get showAddJob;
  @JsonKey(ignore: true)
  $ShowAddJobCopyWith<ShowAddJob> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ShowOnboardingCopyWith<$Res> {
  factory $ShowOnboardingCopyWith(
          ShowOnboarding value, $Res Function(ShowOnboarding) then) =
      _$ShowOnboardingCopyWithImpl<$Res>;
  $Res call({bool showOnboarding});
}

/// @nodoc
class _$ShowOnboardingCopyWithImpl<$Res>
    extends _$NavigationEventCopyWithImpl<$Res>
    implements $ShowOnboardingCopyWith<$Res> {
  _$ShowOnboardingCopyWithImpl(
      ShowOnboarding _value, $Res Function(ShowOnboarding) _then)
      : super(_value, (v) => _then(v as ShowOnboarding));

  @override
  ShowOnboarding get _value => super._value as ShowOnboarding;

  @override
  $Res call({
    Object? showOnboarding = freezed,
  }) {
    return _then(ShowOnboarding(
      showOnboarding == freezed
          ? _value.showOnboarding
          : showOnboarding // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$ShowOnboarding extends ShowOnboarding {
  const _$ShowOnboarding(this.showOnboarding) : super._();

  @override
  final bool showOnboarding;

  @override
  String toString() {
    return 'NavigationEvent.showOnboarding(showOnboarding: $showOnboarding)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ShowOnboarding &&
            const DeepCollectionEquality()
                .equals(other.showOnboarding, showOnboarding));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(showOnboarding));

  @JsonKey(ignore: true)
  @override
  $ShowOnboardingCopyWith<ShowOnboarding> get copyWith =>
      _$ShowOnboardingCopyWithImpl<ShowOnboarding>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(bool isAuth) initialize,
    required TResult Function(bool showChat) showChat,
    required TResult Function(bool showAddJob) showAddJob,
    required TResult Function(bool showOnboarding) showOnboarding,
    required TResult Function(bool showProfile, String tab) showProfile,
    required TResult Function(bool showJobDetails) showJobDetails,
    required TResult Function(bool showDefineLocation) showDefineLocation,
    required TResult Function() logout,
  }) {
    return showOnboarding(this.showOnboarding);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(bool isAuth)? initialize,
    TResult Function(bool showChat)? showChat,
    TResult Function(bool showAddJob)? showAddJob,
    TResult Function(bool showOnboarding)? showOnboarding,
    TResult Function(bool showProfile, String tab)? showProfile,
    TResult Function(bool showJobDetails)? showJobDetails,
    TResult Function(bool showDefineLocation)? showDefineLocation,
    TResult Function()? logout,
  }) {
    return showOnboarding?.call(this.showOnboarding);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(bool isAuth)? initialize,
    TResult Function(bool showChat)? showChat,
    TResult Function(bool showAddJob)? showAddJob,
    TResult Function(bool showOnboarding)? showOnboarding,
    TResult Function(bool showProfile, String tab)? showProfile,
    TResult Function(bool showJobDetails)? showJobDetails,
    TResult Function(bool showDefineLocation)? showDefineLocation,
    TResult Function()? logout,
    required TResult orElse(),
  }) {
    if (showOnboarding != null) {
      return showOnboarding(this.showOnboarding);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Initialize value) initialize,
    required TResult Function(ShowChat value) showChat,
    required TResult Function(ShowAddJob value) showAddJob,
    required TResult Function(ShowOnboarding value) showOnboarding,
    required TResult Function(ShowProfile value) showProfile,
    required TResult Function(ShowJobDetails value) showJobDetails,
    required TResult Function(ShowDefineLocation value) showDefineLocation,
    required TResult Function(Logout value) logout,
  }) {
    return showOnboarding(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(Initialize value)? initialize,
    TResult Function(ShowChat value)? showChat,
    TResult Function(ShowAddJob value)? showAddJob,
    TResult Function(ShowOnboarding value)? showOnboarding,
    TResult Function(ShowProfile value)? showProfile,
    TResult Function(ShowJobDetails value)? showJobDetails,
    TResult Function(ShowDefineLocation value)? showDefineLocation,
    TResult Function(Logout value)? logout,
  }) {
    return showOnboarding?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Initialize value)? initialize,
    TResult Function(ShowChat value)? showChat,
    TResult Function(ShowAddJob value)? showAddJob,
    TResult Function(ShowOnboarding value)? showOnboarding,
    TResult Function(ShowProfile value)? showProfile,
    TResult Function(ShowJobDetails value)? showJobDetails,
    TResult Function(ShowDefineLocation value)? showDefineLocation,
    TResult Function(Logout value)? logout,
    required TResult orElse(),
  }) {
    if (showOnboarding != null) {
      return showOnboarding(this);
    }
    return orElse();
  }
}

abstract class ShowOnboarding extends NavigationEvent {
  const factory ShowOnboarding(bool showOnboarding) = _$ShowOnboarding;
  const ShowOnboarding._() : super._();

  bool get showOnboarding;
  @JsonKey(ignore: true)
  $ShowOnboardingCopyWith<ShowOnboarding> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ShowProfileCopyWith<$Res> {
  factory $ShowProfileCopyWith(
          ShowProfile value, $Res Function(ShowProfile) then) =
      _$ShowProfileCopyWithImpl<$Res>;
  $Res call({bool showProfile, String tab});
}

/// @nodoc
class _$ShowProfileCopyWithImpl<$Res>
    extends _$NavigationEventCopyWithImpl<$Res>
    implements $ShowProfileCopyWith<$Res> {
  _$ShowProfileCopyWithImpl(
      ShowProfile _value, $Res Function(ShowProfile) _then)
      : super(_value, (v) => _then(v as ShowProfile));

  @override
  ShowProfile get _value => super._value as ShowProfile;

  @override
  $Res call({
    Object? showProfile = freezed,
    Object? tab = freezed,
  }) {
    return _then(ShowProfile(
      showProfile == freezed
          ? _value.showProfile
          : showProfile // ignore: cast_nullable_to_non_nullable
              as bool,
      tab: tab == freezed
          ? _value.tab
          : tab // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$ShowProfile extends ShowProfile {
  const _$ShowProfile(this.showProfile, {this.tab = 'myjobs'}) : super._();

  @override
  final bool showProfile;
  @JsonKey()
  @override
  final String tab;

  @override
  String toString() {
    return 'NavigationEvent.showProfile(showProfile: $showProfile, tab: $tab)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ShowProfile &&
            const DeepCollectionEquality()
                .equals(other.showProfile, showProfile) &&
            const DeepCollectionEquality().equals(other.tab, tab));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(showProfile),
      const DeepCollectionEquality().hash(tab));

  @JsonKey(ignore: true)
  @override
  $ShowProfileCopyWith<ShowProfile> get copyWith =>
      _$ShowProfileCopyWithImpl<ShowProfile>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(bool isAuth) initialize,
    required TResult Function(bool showChat) showChat,
    required TResult Function(bool showAddJob) showAddJob,
    required TResult Function(bool showOnboarding) showOnboarding,
    required TResult Function(bool showProfile, String tab) showProfile,
    required TResult Function(bool showJobDetails) showJobDetails,
    required TResult Function(bool showDefineLocation) showDefineLocation,
    required TResult Function() logout,
  }) {
    return showProfile(this.showProfile, tab);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(bool isAuth)? initialize,
    TResult Function(bool showChat)? showChat,
    TResult Function(bool showAddJob)? showAddJob,
    TResult Function(bool showOnboarding)? showOnboarding,
    TResult Function(bool showProfile, String tab)? showProfile,
    TResult Function(bool showJobDetails)? showJobDetails,
    TResult Function(bool showDefineLocation)? showDefineLocation,
    TResult Function()? logout,
  }) {
    return showProfile?.call(this.showProfile, tab);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(bool isAuth)? initialize,
    TResult Function(bool showChat)? showChat,
    TResult Function(bool showAddJob)? showAddJob,
    TResult Function(bool showOnboarding)? showOnboarding,
    TResult Function(bool showProfile, String tab)? showProfile,
    TResult Function(bool showJobDetails)? showJobDetails,
    TResult Function(bool showDefineLocation)? showDefineLocation,
    TResult Function()? logout,
    required TResult orElse(),
  }) {
    if (showProfile != null) {
      return showProfile(this.showProfile, tab);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Initialize value) initialize,
    required TResult Function(ShowChat value) showChat,
    required TResult Function(ShowAddJob value) showAddJob,
    required TResult Function(ShowOnboarding value) showOnboarding,
    required TResult Function(ShowProfile value) showProfile,
    required TResult Function(ShowJobDetails value) showJobDetails,
    required TResult Function(ShowDefineLocation value) showDefineLocation,
    required TResult Function(Logout value) logout,
  }) {
    return showProfile(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(Initialize value)? initialize,
    TResult Function(ShowChat value)? showChat,
    TResult Function(ShowAddJob value)? showAddJob,
    TResult Function(ShowOnboarding value)? showOnboarding,
    TResult Function(ShowProfile value)? showProfile,
    TResult Function(ShowJobDetails value)? showJobDetails,
    TResult Function(ShowDefineLocation value)? showDefineLocation,
    TResult Function(Logout value)? logout,
  }) {
    return showProfile?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Initialize value)? initialize,
    TResult Function(ShowChat value)? showChat,
    TResult Function(ShowAddJob value)? showAddJob,
    TResult Function(ShowOnboarding value)? showOnboarding,
    TResult Function(ShowProfile value)? showProfile,
    TResult Function(ShowJobDetails value)? showJobDetails,
    TResult Function(ShowDefineLocation value)? showDefineLocation,
    TResult Function(Logout value)? logout,
    required TResult orElse(),
  }) {
    if (showProfile != null) {
      return showProfile(this);
    }
    return orElse();
  }
}

abstract class ShowProfile extends NavigationEvent {
  const factory ShowProfile(bool showProfile, {String tab}) = _$ShowProfile;
  const ShowProfile._() : super._();

  bool get showProfile;
  String get tab;
  @JsonKey(ignore: true)
  $ShowProfileCopyWith<ShowProfile> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ShowJobDetailsCopyWith<$Res> {
  factory $ShowJobDetailsCopyWith(
          ShowJobDetails value, $Res Function(ShowJobDetails) then) =
      _$ShowJobDetailsCopyWithImpl<$Res>;
  $Res call({bool showJobDetails});
}

/// @nodoc
class _$ShowJobDetailsCopyWithImpl<$Res>
    extends _$NavigationEventCopyWithImpl<$Res>
    implements $ShowJobDetailsCopyWith<$Res> {
  _$ShowJobDetailsCopyWithImpl(
      ShowJobDetails _value, $Res Function(ShowJobDetails) _then)
      : super(_value, (v) => _then(v as ShowJobDetails));

  @override
  ShowJobDetails get _value => super._value as ShowJobDetails;

  @override
  $Res call({
    Object? showJobDetails = freezed,
  }) {
    return _then(ShowJobDetails(
      showJobDetails == freezed
          ? _value.showJobDetails
          : showJobDetails // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$ShowJobDetails extends ShowJobDetails {
  const _$ShowJobDetails(this.showJobDetails) : super._();

  @override
  final bool showJobDetails;

  @override
  String toString() {
    return 'NavigationEvent.showJobDetails(showJobDetails: $showJobDetails)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ShowJobDetails &&
            const DeepCollectionEquality()
                .equals(other.showJobDetails, showJobDetails));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(showJobDetails));

  @JsonKey(ignore: true)
  @override
  $ShowJobDetailsCopyWith<ShowJobDetails> get copyWith =>
      _$ShowJobDetailsCopyWithImpl<ShowJobDetails>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(bool isAuth) initialize,
    required TResult Function(bool showChat) showChat,
    required TResult Function(bool showAddJob) showAddJob,
    required TResult Function(bool showOnboarding) showOnboarding,
    required TResult Function(bool showProfile, String tab) showProfile,
    required TResult Function(bool showJobDetails) showJobDetails,
    required TResult Function(bool showDefineLocation) showDefineLocation,
    required TResult Function() logout,
  }) {
    return showJobDetails(this.showJobDetails);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(bool isAuth)? initialize,
    TResult Function(bool showChat)? showChat,
    TResult Function(bool showAddJob)? showAddJob,
    TResult Function(bool showOnboarding)? showOnboarding,
    TResult Function(bool showProfile, String tab)? showProfile,
    TResult Function(bool showJobDetails)? showJobDetails,
    TResult Function(bool showDefineLocation)? showDefineLocation,
    TResult Function()? logout,
  }) {
    return showJobDetails?.call(this.showJobDetails);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(bool isAuth)? initialize,
    TResult Function(bool showChat)? showChat,
    TResult Function(bool showAddJob)? showAddJob,
    TResult Function(bool showOnboarding)? showOnboarding,
    TResult Function(bool showProfile, String tab)? showProfile,
    TResult Function(bool showJobDetails)? showJobDetails,
    TResult Function(bool showDefineLocation)? showDefineLocation,
    TResult Function()? logout,
    required TResult orElse(),
  }) {
    if (showJobDetails != null) {
      return showJobDetails(this.showJobDetails);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Initialize value) initialize,
    required TResult Function(ShowChat value) showChat,
    required TResult Function(ShowAddJob value) showAddJob,
    required TResult Function(ShowOnboarding value) showOnboarding,
    required TResult Function(ShowProfile value) showProfile,
    required TResult Function(ShowJobDetails value) showJobDetails,
    required TResult Function(ShowDefineLocation value) showDefineLocation,
    required TResult Function(Logout value) logout,
  }) {
    return showJobDetails(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(Initialize value)? initialize,
    TResult Function(ShowChat value)? showChat,
    TResult Function(ShowAddJob value)? showAddJob,
    TResult Function(ShowOnboarding value)? showOnboarding,
    TResult Function(ShowProfile value)? showProfile,
    TResult Function(ShowJobDetails value)? showJobDetails,
    TResult Function(ShowDefineLocation value)? showDefineLocation,
    TResult Function(Logout value)? logout,
  }) {
    return showJobDetails?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Initialize value)? initialize,
    TResult Function(ShowChat value)? showChat,
    TResult Function(ShowAddJob value)? showAddJob,
    TResult Function(ShowOnboarding value)? showOnboarding,
    TResult Function(ShowProfile value)? showProfile,
    TResult Function(ShowJobDetails value)? showJobDetails,
    TResult Function(ShowDefineLocation value)? showDefineLocation,
    TResult Function(Logout value)? logout,
    required TResult orElse(),
  }) {
    if (showJobDetails != null) {
      return showJobDetails(this);
    }
    return orElse();
  }
}

abstract class ShowJobDetails extends NavigationEvent {
  const factory ShowJobDetails(bool showJobDetails) = _$ShowJobDetails;
  const ShowJobDetails._() : super._();

  bool get showJobDetails;
  @JsonKey(ignore: true)
  $ShowJobDetailsCopyWith<ShowJobDetails> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ShowDefineLocationCopyWith<$Res> {
  factory $ShowDefineLocationCopyWith(
          ShowDefineLocation value, $Res Function(ShowDefineLocation) then) =
      _$ShowDefineLocationCopyWithImpl<$Res>;
  $Res call({bool showDefineLocation});
}

/// @nodoc
class _$ShowDefineLocationCopyWithImpl<$Res>
    extends _$NavigationEventCopyWithImpl<$Res>
    implements $ShowDefineLocationCopyWith<$Res> {
  _$ShowDefineLocationCopyWithImpl(
      ShowDefineLocation _value, $Res Function(ShowDefineLocation) _then)
      : super(_value, (v) => _then(v as ShowDefineLocation));

  @override
  ShowDefineLocation get _value => super._value as ShowDefineLocation;

  @override
  $Res call({
    Object? showDefineLocation = freezed,
  }) {
    return _then(ShowDefineLocation(
      showDefineLocation == freezed
          ? _value.showDefineLocation
          : showDefineLocation // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$ShowDefineLocation extends ShowDefineLocation {
  const _$ShowDefineLocation(this.showDefineLocation) : super._();

  @override
  final bool showDefineLocation;

  @override
  String toString() {
    return 'NavigationEvent.showDefineLocation(showDefineLocation: $showDefineLocation)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ShowDefineLocation &&
            const DeepCollectionEquality()
                .equals(other.showDefineLocation, showDefineLocation));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(showDefineLocation));

  @JsonKey(ignore: true)
  @override
  $ShowDefineLocationCopyWith<ShowDefineLocation> get copyWith =>
      _$ShowDefineLocationCopyWithImpl<ShowDefineLocation>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(bool isAuth) initialize,
    required TResult Function(bool showChat) showChat,
    required TResult Function(bool showAddJob) showAddJob,
    required TResult Function(bool showOnboarding) showOnboarding,
    required TResult Function(bool showProfile, String tab) showProfile,
    required TResult Function(bool showJobDetails) showJobDetails,
    required TResult Function(bool showDefineLocation) showDefineLocation,
    required TResult Function() logout,
  }) {
    return showDefineLocation(this.showDefineLocation);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(bool isAuth)? initialize,
    TResult Function(bool showChat)? showChat,
    TResult Function(bool showAddJob)? showAddJob,
    TResult Function(bool showOnboarding)? showOnboarding,
    TResult Function(bool showProfile, String tab)? showProfile,
    TResult Function(bool showJobDetails)? showJobDetails,
    TResult Function(bool showDefineLocation)? showDefineLocation,
    TResult Function()? logout,
  }) {
    return showDefineLocation?.call(this.showDefineLocation);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(bool isAuth)? initialize,
    TResult Function(bool showChat)? showChat,
    TResult Function(bool showAddJob)? showAddJob,
    TResult Function(bool showOnboarding)? showOnboarding,
    TResult Function(bool showProfile, String tab)? showProfile,
    TResult Function(bool showJobDetails)? showJobDetails,
    TResult Function(bool showDefineLocation)? showDefineLocation,
    TResult Function()? logout,
    required TResult orElse(),
  }) {
    if (showDefineLocation != null) {
      return showDefineLocation(this.showDefineLocation);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Initialize value) initialize,
    required TResult Function(ShowChat value) showChat,
    required TResult Function(ShowAddJob value) showAddJob,
    required TResult Function(ShowOnboarding value) showOnboarding,
    required TResult Function(ShowProfile value) showProfile,
    required TResult Function(ShowJobDetails value) showJobDetails,
    required TResult Function(ShowDefineLocation value) showDefineLocation,
    required TResult Function(Logout value) logout,
  }) {
    return showDefineLocation(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(Initialize value)? initialize,
    TResult Function(ShowChat value)? showChat,
    TResult Function(ShowAddJob value)? showAddJob,
    TResult Function(ShowOnboarding value)? showOnboarding,
    TResult Function(ShowProfile value)? showProfile,
    TResult Function(ShowJobDetails value)? showJobDetails,
    TResult Function(ShowDefineLocation value)? showDefineLocation,
    TResult Function(Logout value)? logout,
  }) {
    return showDefineLocation?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Initialize value)? initialize,
    TResult Function(ShowChat value)? showChat,
    TResult Function(ShowAddJob value)? showAddJob,
    TResult Function(ShowOnboarding value)? showOnboarding,
    TResult Function(ShowProfile value)? showProfile,
    TResult Function(ShowJobDetails value)? showJobDetails,
    TResult Function(ShowDefineLocation value)? showDefineLocation,
    TResult Function(Logout value)? logout,
    required TResult orElse(),
  }) {
    if (showDefineLocation != null) {
      return showDefineLocation(this);
    }
    return orElse();
  }
}

abstract class ShowDefineLocation extends NavigationEvent {
  const factory ShowDefineLocation(bool showDefineLocation) =
      _$ShowDefineLocation;
  const ShowDefineLocation._() : super._();

  bool get showDefineLocation;
  @JsonKey(ignore: true)
  $ShowDefineLocationCopyWith<ShowDefineLocation> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LogoutCopyWith<$Res> {
  factory $LogoutCopyWith(Logout value, $Res Function(Logout) then) =
      _$LogoutCopyWithImpl<$Res>;
}

/// @nodoc
class _$LogoutCopyWithImpl<$Res> extends _$NavigationEventCopyWithImpl<$Res>
    implements $LogoutCopyWith<$Res> {
  _$LogoutCopyWithImpl(Logout _value, $Res Function(Logout) _then)
      : super(_value, (v) => _then(v as Logout));

  @override
  Logout get _value => super._value as Logout;
}

/// @nodoc

class _$Logout extends Logout {
  const _$Logout() : super._();

  @override
  String toString() {
    return 'NavigationEvent.logout()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is Logout);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(bool isAuth) initialize,
    required TResult Function(bool showChat) showChat,
    required TResult Function(bool showAddJob) showAddJob,
    required TResult Function(bool showOnboarding) showOnboarding,
    required TResult Function(bool showProfile, String tab) showProfile,
    required TResult Function(bool showJobDetails) showJobDetails,
    required TResult Function(bool showDefineLocation) showDefineLocation,
    required TResult Function() logout,
  }) {
    return logout();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(bool isAuth)? initialize,
    TResult Function(bool showChat)? showChat,
    TResult Function(bool showAddJob)? showAddJob,
    TResult Function(bool showOnboarding)? showOnboarding,
    TResult Function(bool showProfile, String tab)? showProfile,
    TResult Function(bool showJobDetails)? showJobDetails,
    TResult Function(bool showDefineLocation)? showDefineLocation,
    TResult Function()? logout,
  }) {
    return logout?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(bool isAuth)? initialize,
    TResult Function(bool showChat)? showChat,
    TResult Function(bool showAddJob)? showAddJob,
    TResult Function(bool showOnboarding)? showOnboarding,
    TResult Function(bool showProfile, String tab)? showProfile,
    TResult Function(bool showJobDetails)? showJobDetails,
    TResult Function(bool showDefineLocation)? showDefineLocation,
    TResult Function()? logout,
    required TResult orElse(),
  }) {
    if (logout != null) {
      return logout();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Initialize value) initialize,
    required TResult Function(ShowChat value) showChat,
    required TResult Function(ShowAddJob value) showAddJob,
    required TResult Function(ShowOnboarding value) showOnboarding,
    required TResult Function(ShowProfile value) showProfile,
    required TResult Function(ShowJobDetails value) showJobDetails,
    required TResult Function(ShowDefineLocation value) showDefineLocation,
    required TResult Function(Logout value) logout,
  }) {
    return logout(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(Initialize value)? initialize,
    TResult Function(ShowChat value)? showChat,
    TResult Function(ShowAddJob value)? showAddJob,
    TResult Function(ShowOnboarding value)? showOnboarding,
    TResult Function(ShowProfile value)? showProfile,
    TResult Function(ShowJobDetails value)? showJobDetails,
    TResult Function(ShowDefineLocation value)? showDefineLocation,
    TResult Function(Logout value)? logout,
  }) {
    return logout?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Initialize value)? initialize,
    TResult Function(ShowChat value)? showChat,
    TResult Function(ShowAddJob value)? showAddJob,
    TResult Function(ShowOnboarding value)? showOnboarding,
    TResult Function(ShowProfile value)? showProfile,
    TResult Function(ShowJobDetails value)? showJobDetails,
    TResult Function(ShowDefineLocation value)? showDefineLocation,
    TResult Function(Logout value)? logout,
    required TResult orElse(),
  }) {
    if (logout != null) {
      return logout(this);
    }
    return orElse();
  }
}

abstract class Logout extends NavigationEvent {
  const factory Logout() = _$Logout;
  const Logout._() : super._();
}
