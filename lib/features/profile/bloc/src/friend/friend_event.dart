part of 'friend_bloc.dart';

abstract class FriendEvent {}

class FriendsLoadEvent extends FriendEvent {}

class FriendsSearchEvent extends FriendEvent {
  final String identifier;
  FriendsSearchEvent({required this.identifier});
}

class FriendAddRequestEvent extends FriendEvent {
  final String id;
  FriendAddRequestEvent({required this.id});
}

class FriendLoadRequestsEvent extends FriendEvent {

}

class FriendUpdateRequestEvent extends FriendEvent {
  final String objectId;
  final bool accept;
  FriendUpdateRequestEvent({required this.accept, required this.objectId});
}
