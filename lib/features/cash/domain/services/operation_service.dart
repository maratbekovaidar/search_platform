import 'package:dsplatform/constants/constants.dart';
import 'package:dsplatform/features/cash/domain/models/operation/operation_model.dart';
import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class OperationService {

  final _dio = Dio(
    BaseOptions(
      baseUrl: ApiPath.apiPath,
      validateStatus: (status) {
        return status! < 500;
      }
    )
  );

  Future<List<OperationModel>> getOperations() async {

    try {
      Response response = await _dio.get(
        "/data/Operations",
        queryParameters: {
          "where": "user.objectId='${await const FlutterSecureStorage().read(key: AppSecureStorageKeys.objectIdKey)}'",
          "loadRelations": "user"
        },
        options: Options(
          headers: {
            "user-token": await const FlutterSecureStorage().read(key: AppSecureStorageKeys.tokenKey)
          }
        )
      );
      return (response.data as List).map((e) => OperationModel.fromJson(e)).toList();
    } on Exception catch (e, _) {
      rethrow;
    }

  }

}