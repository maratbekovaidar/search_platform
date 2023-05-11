part of 'user_bloc.dart';

abstract class UserEvent {}

class UserLoadEvent extends UserEvent {
}

class UserDataUpdateEvent extends UserEvent {
  final UserModel userModel;
  UserDataUpdateEvent({required this.userModel});
}
