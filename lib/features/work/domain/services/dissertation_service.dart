import 'dart:io';

import 'package:dio/dio.dart';
import 'package:dsplatform/constants/api/api_path.dart';
import 'package:dsplatform/features/authorization/provider/authenticator.dart';
import 'package:dsplatform/features/work/domain/models/dissertation/dissertation_model.dart';
import 'package:get_it/get_it.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:share_plus/share_plus.dart';

class DissertationService {

  final _dio = Dio(
    BaseOptions(
      baseUrl: ApiPath.apiPath,
      validateStatus: (statusCode) {
        return statusCode! < 500;
      }
    )
  );

  Future<List<DissertationModel>> getDissertations(String? filter) async {
    try {
      Response response = await _dio.get(
        "/dissertation",
        queryParameters: {
          "query": filter,
          "userOnly": false
        },
        options: Options(
          headers: {
            "Authorization": "Bearer ${GetIt.I.get<Authenticator>().credentials.accessToken}"
          }
        )
      );
      if(response.statusCode == 200) {
        return (response.data['content'] as List).map((e) => DissertationModel.fromJson(e)).toList();
      } else{
        throw Exception();
      }
    } on Exception catch(e, _) {
      rethrow;
    }
  }

  Future<void> downloadFile(String filename) async {
    Directory documents = await getApplicationDocumentsDirectory();
    print("${documents.path}/$filename");
    try {
      Response response = await _dio.download(
          "/fs/download",
          "${documents.path}/$filename",
          queryParameters: {
            "filename": filename,
          },
          options: Options(
              headers: {
                "Authorization": "Bearer ${GetIt.I.get<Authenticator>().credentials.accessToken}"
              }
          )
      );
      Share.shareXFiles([
        XFile("${documents.path}/$filename")
      ]);
      if(response.statusCode == 200) {
        print(response.data.toString());
      } else{
        throw Exception();
      }
    } on Exception catch(e, _) {
      rethrow;
    }
  }


}