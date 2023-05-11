import 'dart:convert';

import 'package:dsplatform/constants/constants.dart';
import 'package:dsplatform/features/shop/domain/models/category/category_model.dart';
import 'package:dsplatform/features/shop/domain/models/like/like_model.dart';
import 'package:dsplatform/features/shop/domain/models/product/product_model.dart';
import 'package:dsplatform/features/shop/domain/models/purchase_enum/purchase_enum.dart';
import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class ProductService {

  final _dio = Dio(
    BaseOptions(
      baseUrl: ApiPath.apiPath,
      validateStatus: (status) {
        return status! < 1000;
      }
    )
  );

  Future<List<ProductModel>> getProducts() async {
    try {
      Response response;
      response = await _dio.get(
        "/data/Products",
        options: Options(
          headers: {
            "user-auth": await const FlutterSecureStorage().read(key: AppSecureStorageKeys.tokenKey)
          }
        )
      );
      return (response.data as List).map((e) => ProductModel.fromJson(e)).toList();
    } on Exception catch (e, _) {
      rethrow;
    }
  }

  Future<List<CategoryModel>> getCategories() async {
    try {
      Response response;
      response = await _dio.get(
        "/data/Categories",
        options: Options(
          headers: {
            "user-auth": await const FlutterSecureStorage().read(key: AppSecureStorageKeys.tokenKey)
          }
        )
      );
      return (response.data as List).map((e) => CategoryModel.fromJson(e)).toList();
    } on Exception catch (e, _) {
      rethrow;
    }
  }

  Future<List<ProductModel>> getProductsByCategory(String categoryId) async {
    try {
      Response response;
      response = await _dio.get(
        "/data/Products",
        queryParameters: {
          "where": "category.objectId='$categoryId'",
          "loadRelations": "category"
        },
        options: Options(
          headers: {
            "user-auth": await const FlutterSecureStorage().read(key: AppSecureStorageKeys.tokenKey)
          }
        )
      );
      return (response.data as List).map((e) => ProductModel.fromJson(e)).toList();
    } on Exception catch (e, _) {
      rethrow;
    }
  }

  Future<PurchaseEnum> purchaseProduct(String objectId) async {
    try {
      Response response = await _dio.post(
        "/services/OrdersService/purchase",
        data: jsonEncode(objectId),
        options: Options(
          headers: {
            "user-token": await const FlutterSecureStorage().read(key: AppSecureStorageKeys.tokenKey)
          }
        )
      );
      if(response.statusCode == 200) {
        return PurchaseEnum.SUCCESS;
      }
      if(response.statusCode == 402) {
        return PurchaseEnum.NOT_ENOUGH_COST;
      }
      if(response.statusCode == 503) {
        return PurchaseEnum.NOT_ENOUGH_COUNT;
      }
      return PurchaseEnum.UNKNOWN_FAILURE;
    } on Exception catch (e, _) {
      rethrow;
    }
  }

  Future<LikeModel> getLikes(String objectId) async {
    Response response = await _dio.get(
      "/services/ProductsService/likes",
      queryParameters: {
        "productObjectId" : objectId
      },
      options: Options(
        headers: {
          "user-token": await const FlutterSecureStorage().read(key: AppSecureStorageKeys.tokenKey)
        }
      )
    );
    return LikeModel.fromJson(response.data);
  }

  Future<bool> likeProduct(String objectId) async {
    Response response = await _dio.post(
      "/services/ProductsService/like",
      data: jsonEncode(objectId),
      options: Options(
        headers: {
          "user-token": await const FlutterSecureStorage().read(key: AppSecureStorageKeys.tokenKey)
        }
      )
    );
    if(response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }

}