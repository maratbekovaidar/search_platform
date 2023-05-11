part of 'friend_bloc.dart';

abstract class FriendState {}

class FriendInitialState extends FriendState {}

class FriendLoadingState extends FriendState {}

class FriendLoadedState extends FriendState {
  final List<UserModel> friends;
  FriendLoadedState({required this.friends});
}

class FriendRequestsLoadedState extends FriendState {
  final List<FriendRequestModel> loadedRequests;
  FriendRequestsLoadedState({required this.loadedRequests});
}

class FriendFailureState extends FriendState {

}

class FriendRequestSuccessState extends FriendState {}
