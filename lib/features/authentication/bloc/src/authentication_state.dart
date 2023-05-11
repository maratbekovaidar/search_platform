part of 'authentication_bloc.dart';

abstract class AuthenticationState {}

/// App starting state
class AuthenticationUninitializedState extends AuthenticationState {}

/// Loading state
class AuthenticationLoadingState extends AuthenticationState {}

/// Authenticated state or Unknown state
class AuthenticationAuthenticatedState extends AuthenticationState {
  final bool pinCodeSet;
  final bool isUserFillProfile;
  AuthenticationAuthenticatedState({required this.pinCodeSet, required this.isUserFillProfile});
}

/// Unauthenticated state
class AuthenticationUnauthenticatedState extends AuthenticationState {
}

