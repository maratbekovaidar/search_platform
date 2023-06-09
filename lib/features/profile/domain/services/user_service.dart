import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:dsplatform/constants/constants.dart';
import 'package:dsplatform/features/authentication/authentication.dart';
import 'package:dsplatform/features/authorization/provider/authenticator.dart';
import 'package:dsplatform/features/profile/domain/models/user/user_model.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get_it/get_it.dart';
import 'package:image_picker/image_picker.dart';
import 'package:jwt_decoder/jwt_decoder.dart';

class UserService {

  final _dio = Dio(
    BaseOptions(
      baseUrl: ApiPath.apiPath,
      validateStatus: (statusCode) {
        return statusCode! < 500;
      }
    )
  );

  Future<UserModel?> getUser() async {
    var response = await _dio.get(
      '/users/${JwtDecoder.decode(GetIt.I.get<Authenticator>().credentials.accessToken)['id']}',
      options: Options(
        headers: {
          "Authorization":  "Bearer ${GetIt.I.get<Authenticator>().credentials.accessToken}"
        }
      )
    );
    try {
      await const FlutterSecureStorage().write(key: AppSecureStorageKeys.objectIdKey, value: response.data["id"].toString());
      await const FlutterSecureStorage().write(key: AppSecureStorageKeys.userEmailKey, value: response.data["email"].toString());
    } catch(e, _) {
      rethrow;
    }
    if(response.data["firstName"] != null) {
      log(response.data["firstName"], name: "User name");
      return UserModel.fromJson(response.data);
    } else {
      return null;
    }
  }

  Future<bool> updateUser(UserModel userModel) async {

    var response = await _dio.put(
      "/users",
      data: userModel.toJson(),
      options: Options(
        headers: {
          "Authorization": "Bearer ${GetIt.I.get<Authenticator>().credentials.accessToken}"
        }
      )
    );

    print(response.statusCode);
    if(response.statusCode == 401) {
      GetIt.I.get<AuthenticationBloc>().add(LoggedOut());
    }
    if(response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }


  Future<String?> uploadFile(XFile file) async {
    return null;
  }


}