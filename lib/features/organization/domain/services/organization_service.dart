import 'dart:io';

import 'package:dio/dio.dart';
import 'package:dsplatform/constants/api/api_path.dart';
import 'package:dsplatform/features/authorization/provider/authenticator.dart';
import 'package:dsplatform/features/organization/domain/models/organization/organization_model.dart';
import 'package:get_it/get_it.dart';

class OrganizationService {

  final _dio = Dio(
    BaseOptions(
      baseUrl: ApiPath.apiPath,
      validateStatus: (statusCode) {
        return statusCode! < 500;
      }
    )
  );

  Future<List<OrganizationModel>> getOrganizations() async {
    try {
      Response response = await _dio.get(
        "/organization",
        options: Options(
          headers: {
            "Authorization": "Bearer ${GetIt.I.get<Authenticator>().credentials.accessToken}"
          }
        )
      );
      if(response.statusCode == 200) {
        return (response.data['content'] as List).map((e) => OrganizationModel.fromJson(e)).toList();
      } else if(response.statusCode == 401) {
        throw const WebSocketException();
      } else {
        throw Exception();
      }
    } on Exception catch(e, _) {
      rethrow;
    }
  }

}