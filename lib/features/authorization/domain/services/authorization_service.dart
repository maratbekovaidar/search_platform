import 'package:dsplatform/constants/constants.dart';
import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class AuthorizationService {

  final _dio = Dio(
    BaseOptions(
      baseUrl: ApiPath.apiPath,
      validateStatus: (status) {
        return status! < 1000;
      }
    ),
  );


  /// Login
  Future<String?> login(String email, String password) async {
    return "token_example";
  }

  /// Logout
  Future<bool> logout() async {
    Response response;
    response = await _dio.post(
      '/logout',
      options: Options(
        followRedirects: false,
        validateStatus: (status) {
          return status! < 500;
        },
        headers: {
          "Authorization": "Bearer ${await const FlutterSecureStorage().read(key: AppSecureStorageKeys.tokenKey)}"
        }
      )
    );
    if(response.statusCode == 200) {
      return true;
    }
    return false;
  }

  /// Registration
  Future<bool> register(String email, String password) async {
    try {
      Response response;
      response = await _dio.post(
        '/users/register',
        data: {
          'email': email,
          'password': password,
          'confirmPassword': password,
          "agreement": true
        },
      );
      print(response.statusCode);
      print(response.data);
      if(response.statusCode == 201) {
        return true;
      } else {
        return false;
      }
    } on Exception catch (e, _) {
      rethrow;
    }
  }

  /// Check email for invite
  Future<bool> isUserInvited(String email) async {
    Response response;
    response = await _dio.get(
      '/services/RegistrationService/isInvited',
      queryParameters: {
        "email": email
      }
    );
    if(response.statusCode == 200) {
      return response.data;
    } else {
      return false;
    }
  }


}