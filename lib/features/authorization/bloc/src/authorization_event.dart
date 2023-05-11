part of 'authorization_bloc.dart';

abstract class AuthorizationEvent {}

class AuthorizationLoginButtonPressedEvent extends AuthorizationEvent {
  final String username;
  final String password;
  final bool rememberLogin;
  AuthorizationLoginButtonPressedEvent({required this.username, required this.password, this.rememberLogin = false});
}

class AuthorizationLogoutButtonPressedEvent extends AuthorizationEvent {

}

class AuthorizationRegistrationButtonPressedEvent extends AuthorizationEvent {
  final String username;
  final String password;
  AuthorizationRegistrationButtonPressedEvent({required this.username, required this.password});
}

class AuthorizationIsUserInvitedEvent extends AuthorizationEvent {
  final String email;
  AuthorizationIsUserInvitedEvent({required this.email});
}
