import 'dart:convert';

import 'package:dsplatform/features/profile/domain/models/invite/invite_model.dart';
import 'package:dio/dio.dart';
import 'package:dsplatform/constants/constants.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;

class InviteService {
  final _dio = Dio(
    BaseOptions(
      baseUrl: ApiPath.apiPath,
      validateStatus: (status) {
        return status! < 500;
      },
    )
  );

  Future<bool> inviteByEmail(String email) async {
    String? token = await const FlutterSecureStorage().read(key: AppSecureStorageKeys.tokenKey);
    await http.post(Uri.parse(
      "http://api.backendless.com/A00BBB13-4A56-AF37-FF6E-EDC5D9B3F000/1FB0630A-3A82-4B95-A740-E5B8B7499FC4/services/RegistrationService/invite"
    ), body: email, headers: {
      "user-token": token ?? ""
    });
    return true;
  }

  Future<List<InviteModel>> getInvites() async {
    Response response;
    try {
      response = await _dio.get(
        "/services/RegistrationService/invites",
        options: Options(
          headers: {
            "user-token": await const FlutterSecureStorage().read(key: AppSecureStorageKeys.tokenKey)
          }
        )
      );
    } on Exception catch (e, _) {
      rethrow;
    }
    return (response.data as List).map((e) => InviteModel.fromJson(e)).toList();
  }

  Future<bool> revokeInvite(String email) async {
    try {
      Response response = await _dio.delete(
        "/services/RegistrationService/invite",
        data: jsonEncode(email),
        options: Options(
          headers: {
            "user-token": await const FlutterSecureStorage().read(key: AppSecureStorageKeys.tokenKey)
          }
        )
      );
      if(response.statusCode == 200) {
        return true;
      }
      return false;
    } on Exception catch(e, _) {
      rethrow;
    }
  }

}