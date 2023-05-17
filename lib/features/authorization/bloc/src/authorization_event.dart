part of 'authorization_bloc.dart';

abstract class AuthorizationEvent {}

class AuthorizationLoginButtonPressedEvent extends AuthorizationEvent {
  AuthorizationLoginButtonPressedEvent();
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
