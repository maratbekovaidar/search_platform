part of 'avatar_bloc.dart';

abstract class AvatarState {}

class AvatarInitialState extends AvatarState {}

class UserAvatarUploadingState extends AvatarState {
  /// TODO: implement progress
  /// ...
}

class UserAvatarUploadedState extends AvatarState {
  final String avatarUrl;
  UserAvatarUploadedState({required this.avatarUrl});
}

class UserAvatarUploadFailureState extends AvatarState {}