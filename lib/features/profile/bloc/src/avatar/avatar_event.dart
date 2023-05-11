part of 'avatar_bloc.dart';

abstract class AvatarEvent {}

class UserAvatarUploadEvent extends AvatarEvent {
  final XFile avatar;
  UserAvatarUploadEvent({required this.avatar});
}
