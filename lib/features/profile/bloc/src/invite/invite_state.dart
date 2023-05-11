part of 'invite_bloc.dart';

@immutable
abstract class InviteState {}

class InviteInitialState extends InviteState {}

class InviteLoadingState extends InviteState {}

class InviteLoadedState extends InviteState {
  final List<InviteModel> invites;
  InviteLoadedState({required this.invites});
}

class InviteFailureState extends InviteState {}

class InviteSuccessState extends InviteState {}

