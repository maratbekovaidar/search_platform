import 'package:dsplatform/constants/constants.dart';
import 'package:dsplatform/features/authentication/authentication.dart';
import 'package:dsplatform/features/profile/domain/models/user/user_model.dart';
import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get_it/get_it.dart';
import 'package:image_picker/image_picker.dart';

class UserService {

  final _dio = Dio(
    BaseOptions(
      baseUrl: ApiPath.apiPath,
      // validateStatus: (statusCode) {
      //   if(statusCode == 401) {
      //     GetIt.I.get<AuthenticationBloc>().add(LoggedOut());
      //   }
      //   return false;
      // }
    )
  );

  Future<UserModel?> getUser() async {
    Response response;
    response = await _dio.get('/data/Users/${await const FlutterSecureStorage().read(key: AppSecureStorageKeys.objectIdKey)}');
    if(response.data["identifier"] != null) {
      return UserModel.fromJson(response.data);
    } else {
      return null;
    }
  }

  Future<bool> updateUser(UserModel userModel) async {
    Response response = await _dio.put(
      '/data/Users/${await const FlutterSecureStorage().read(key: AppSecureStorageKeys.objectIdKey)}',
      data: userModel.toJsonForUpdate(),
      options: Options(
        headers: {
          'user-token': await const FlutterSecureStorage().read(key: AppSecureStorageKeys.tokenKey)
        }
      ),
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

  Future<bool> isIdentifierFree(String identifier) async {
    Response response;
    response = await _dio.get(
      '/data/Users',
      queryParameters: {
        "where": "identifier = '$identifier'"
      }
    );
    if((response.data as List).isEmpty) {
      return true;
    } else {
      return false;
    }
  }

  Future<List<UserModel>> findUserByIdentifier(String identifier) async {
    Response response;
    response = await _dio.get(
      '/data/Users',
      queryParameters: {
        "where": "identifier = '$identifier'"
      }
    );
    return (response.data as List).map((e) => UserModel.fromJson(e)).toList();
  }

  Future<String?> uploadFile(XFile file) async {
    final FormData formData = FormData.fromMap({
      '': await MultipartFile.fromFile(file.path)
    });
    String objectId = await const FlutterSecureStorage().read(key: AppSecureStorageKeys.objectIdKey) ?? "";
    Response response;
    response = await _dio.post(
      '/files/files/$objectId.png',
      queryParameters: {
        'overwrite': 'true'
      },
      data: formData
    );
    if(response.statusCode == 200) {
      return response.data['fileURL'];
    }
    return null;
  }


}