part of 'auth_bloc.dart';

sealed class AuthEvent extends Equatable {
  const AuthEvent();

  @override
  List<Object> get props => [];
}

final class AuthInitialEvent extends AuthEvent {}

final class AuthLoggedInEvent extends AuthEvent {}

final class AuthLoggedOutEvent extends AuthEvent {}

final class AuthLogoutEvent extends AuthEvent {
  final String token;

  const AuthLogoutEvent(this.token);

  @override
  List<Object> get props => [token];
}

final class AuthLoginEvent extends AuthEvent {
  final LoginEntity loginEntity;

  const AuthLoginEvent(this.loginEntity);

  @override
  List<Object> get props => [loginEntity];
}

final class AuthRegisterEvent extends AuthEvent {
  final String username;
  final String password;

  const AuthRegisterEvent(this.username, this.password);

  @override
  List<Object> get props => [username, password];
}

final class GetTokenEvent extends AuthEvent {}
