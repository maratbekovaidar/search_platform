import 'dart:convert';

import 'package:dsplatform/constants/constants.dart';
import 'package:dsplatform/features/profile/domain/models/friend_request/friend_request_model.dart';
import 'package:dsplatform/features/profile/domain/models/user/user_model.dart';
import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;
class FriendService {

  final _dio = Dio(
    BaseOptions(
      baseUrl: ApiPath.apiPath,
      validateStatus: (status) {
        return status! < 500;
      },
    ),
  );

  Future<bool> addFriend(String id) async {
    var response = await http.post(Uri.parse(
        "${ApiPath.apiPath}/services/FriendsService/sendFriendRequest"
      ),
      headers: {
        "user-token": await const FlutterSecureStorage().read(key: AppSecureStorageKeys.tokenKey) ?? ""
      },
      body: id,
    );
    if(response.statusCode == 200) {
      return true;
    }
    return false;
  }

  Future<List<FriendRequestModel>> getFriendRequests() async {
    Response response;
    response = await _dio.get(
      "/services/FriendsService/getFriendRequests",
      options: Options(
        headers: {
          "user-token": await const FlutterSecureStorage().read(key: AppSecureStorageKeys.tokenKey) ?? ""
        },
      )
    );
    return (response.data as List).map((e) => FriendRequestModel.fromJson(e)).toList();
  }

  Future<List<UserModel>> getFriends() async {
    Response response;
    response = await _dio.get(
      "/data/Friends",
      queryParameters: {
        "where": "user.objectId='${await const FlutterSecureStorage().read(key: AppSecureStorageKeys.objectIdKey)}'",
        "loadRelations": "user,user_friend"
      },
      options: Options(
        headers: {
          "user-token": await const FlutterSecureStorage().read(key: AppSecureStorageKeys.tokenKey) ?? ""
        },
      )
    );
    return (response.data as List).map((e) => UserModel.fromJson(e['user_friend'])).toList();
  }

  Future<bool> updateFriendRequest(bool accept, String friendRequestObjectId) async {
    Response response;
    response = await _dio.put(
      "/data/FriendRequests/$friendRequestObjectId",
      data: {
        "status": accept ? "ACCEPTED" : "DECLINED"
      },
      options: Options(
        headers: {
          "user-token": await const FlutterSecureStorage().read(key: AppSecureStorageKeys.tokenKey) ?? ""
        },
      )
    );
    if(response.statusCode == 200) {
      return true;
    }
    return false;
  }

  Future<bool> removeFriend(String friend) async {
    Response response;
    response = await _dio.delete(
      "/services/FriendsService/removeFriend",
      data: jsonEncode(friend),
      options: Options(
        headers: {
          "user-token": await const FlutterSecureStorage().read(key: AppSecureStorageKeys.tokenKey) ?? ""
        },
      )
    );
    if(response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }

}