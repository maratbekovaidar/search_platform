import 'package:dsplatform/features/profile/domain/models/friend_request/friend_request_model.dart';
import 'package:dsplatform/features/profile/domain/models/user/user_model.dart';
import 'package:dsplatform/features/profile/domain/services/friend_service.dart';
import 'package:dsplatform/features/profile/domain/services/user_service.dart';

abstract class FriendRepository {

  Future<bool> addFriend(String id);

  Future<List<UserModel>> searchFriend(String id);

  Future<List<FriendRequestModel>> getFriendRequests();

  Future<List<UserModel>> getFriends();

  Future<bool> updateFriendRequest(bool accept, String friendRequestObjectId);

  Future<bool> removeFriend(String friend);
}

class IFriendRepository extends FriendRepository {

  final FriendService _friendService = FriendService();
  final UserService _userService = UserService();

  @override
  Future<bool> addFriend(String id) => _friendService.addFriend(id);

  @override
  Future<List<UserModel>> searchFriend(String id) => _userService.findUserByIdentifier(id);

  @override
  Future<List<FriendRequestModel>> getFriendRequests() => _friendService.getFriendRequests();

  @override
  Future<List<UserModel>> getFriends() => _friendService.getFriends();

  @override
  Future<bool> updateFriendRequest(bool accept, String friendRequestObjectId) => _friendService.updateFriendRequest(accept, friendRequestObjectId);

  @override
  Future<bool> removeFriend(String friend) => _friendService.removeFriend(friend);
}