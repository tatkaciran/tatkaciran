import 'dart:async';

import 'package:authentication_repository/authentication_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import 'package:pedantic/pedantic.dart';

part 'authentication_event.dart';
part 'authentication_state.dart';

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  AuthenticationBloc({
    required AuthenticationRepository authenticationRepository,
  })  : _authenticationRepository = authenticationRepository,
        super(const AuthenticationState.unknown()) {
    _authenticationUserChangedStream(authenticationRepository);
    on<AuthenticationUserChanged>(_onAuthenticationUserChanged);
    on<AuthenticationLogoutRequested>(_onAuthenticationLogoutRequested);
  }

  Future<void> _authenticationUserChangedStream(
    AuthenticationRepository authenticationRepository,
  ) async {
    Stream<AuthUser> userStream = authenticationRepository.user;
    await for (AuthUser user in userStream) {
      add(AuthenticationUserChanged(user));
    }
  }

  final AuthenticationRepository _authenticationRepository;

  void _onAuthenticationUserChanged(
      AuthenticationUserChanged event, Emitter<AuthenticationState> emit) {
    event.user != const AuthUser.empty()
        ? emit(AuthenticationState.authentication(event.user))
        : emit(const AuthenticationState.unauthenticated());
  }

  void _onAuthenticationLogoutRequested(
      AuthenticationLogoutRequested event, Emitter<AuthenticationState> emit) {
    unawaited(_authenticationRepository.logOut());
  }
}
