part of 'user_bloc.dart';

abstract class UserState {}

class UserInitialState extends UserState {}

class UserLoadingState extends UserState {}

class UserFailureState extends UserState {
  final Exception exception;
  UserFailureState({required this.exception});
}

class UserLoadedState extends UserState {
  final UserModel userModel;
  UserLoadedState({required this.userModel});
}

class UserUpdatedState extends UserState {}

class UserUpdatingState extends UserState {}

