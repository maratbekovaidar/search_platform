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
    // Response response;
    // // Response registerDeviceResponse;
    // response = await _dio.post('/users/login', data: {
    //   'login': email,
    //   'password': password
    // });
    /// Register user device
    // registerDeviceResponse = await _dio.post(
    //   "/services/RegistrationService/registerDevice",
    //   data: jsonEncode(
    //     response.data["objectId"].toString(),
    //   ),
    //   options: Options(
    //     headers: {
    //       "user-token": response.data["user-token"].toString()
    //     }
    //   )
    // );
    // await const FlutterSecureStorage().write(key: AppSecureStorageKeys.objectIdKey, value: response.data["objectId"].toString());
    // await const FlutterSecureStorage().write(key: AppSecureStorageKeys.remainingInvitesKey, value: response.data["remaining_invites"].toString());
    // await const FlutterSecureStorage().write(key: AppSecureStorageKeys.userEmailKey, value: response.data["email"].toString());
    // if(response.data["firstname"] != null) {
    //   await const FlutterSecureStorage().write(
    //     key: AppSecureStorageKeys.userFullName,
    //     value: "${response.data["firstname"]} ${response.data["lastname"].toString().substring(0, 1)}."
    //   );
    // }
    // return response.data["user-token"];
    return "token_example";
  }

  /// Logout
  Future<bool> logout() async {
    Response response;
    response = await _dio.get(
      '/users/logout',
      options: Options(
        followRedirects: false,
        validateStatus: (status) {
          return status! < 500;
        },
        headers: {
          "user-token": await const FlutterSecureStorage().read(key: AppSecureStorageKeys.tokenKey)
        }
      )
    );
    if(response.statusCode == 200) {
      return true;
    }
    return false;
  }

  /// Registration
  Future<String?> register(String email, String password) async {
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
    if(response.statusCode == 200) {
      return await login(email, password);
    } else {
      return null;
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