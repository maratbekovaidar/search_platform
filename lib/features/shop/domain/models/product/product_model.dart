import 'package:dsplatform/features/shop/domain/models/like/like_model.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'product_model.freezed.dart';
part 'product_model.g.dart';

@freezed
class ProductModel with _$ProductModel {
  @JsonSerializable(explicitToJson: true)
  const factory ProductModel({
    required int id,
    required String objectId,
    required int created,
    required int? updated,
    required String? owner,
    required String name,
    required String description,
    required int count,
    required double cost,
    required bool isAvailable,
    required String productUrl,
    required String image,
    required LikeModel? likeModel
  }) = _ProductModel;
  


  factory ProductModel.fromJson(Map<String, dynamic> json) =>
      _$ProductModelFromJson(json);
}