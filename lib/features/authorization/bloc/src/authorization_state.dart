part of 'authorization_bloc.dart';

abstract class AuthorizationState {}

class AuthorizationInitialState extends AuthorizationState {}

class AuthorizationLoadingState extends AuthorizationState {}

class AuthorizationSuccessState extends AuthorizationState {
  final String token;
  AuthorizationSuccessState({required this.token});
}

class AuthorizationFailureState extends AuthorizationState {
  final Exception exception;
  AuthorizationFailureState({required this.exception});
}

class AuthorizationFailureException implements Exception {
  final dynamic message;

  AuthorizationFailureException([this.message]);

  @override
  String toString() {
    Object? message = this.message;
    if (message == null) return "Exception";
    return "Exception: $message";
  }
}

class AuthorizationUserInvitedState extends AuthorizationState {
  final bool result;
  AuthorizationUserInvitedState({required this.result});
}