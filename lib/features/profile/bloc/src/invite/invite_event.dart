part of 'invite_bloc.dart';

abstract class InviteEvent {}

class InviteByEmailEvent extends InviteEvent {
  final String email;
  InviteByEmailEvent({required this.email});
}

class InviteLoadEvent extends InviteEvent {}

class InviteRevokeEvent extends InviteEvent {
  final String email;
  InviteRevokeEvent({required this.email});
}