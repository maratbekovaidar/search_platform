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
    log(GetIt.I.get<Authenticator>().credentials.accessToken, name: "Access token");
    var response = await _dio.get(
      '/users/${JwtDecoder.decode(GetIt.I.get<Authenticator>().credentials.accessToken)['id']}',
      options: Options(
        headers: {
          "Authorization":  "Bearer ${GetIt.I.get<Authenticator>().credentials.accessToken}"
        }
      )
    );
    print(response.statusCode);
    print(response.data);
    if(response.data["firstName"] != null) {
      return UserModel.fromJson(jsonDecode(response.data));
    } else {
      return null;
    }
  }

  Future<bool> updateUser(UserModel userModel) async {

    var response = await GetIt.I.get<Authenticator>().client!.put(
      Uri.parse('/users/${JwtDecoder.decode(GetIt.I.get<Authenticator>().credentials.accessToken)}'),
      body: userModel.toJson()
    );

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