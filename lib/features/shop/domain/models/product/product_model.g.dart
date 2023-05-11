// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ProductModel _$$_ProductModelFromJson(Map<String, dynamic> json) =>
    _$_ProductModel(
      id: json['id'] as int,
      objectId: json['objectId'] as String,
      created: json['created'] as int,
      updated: json['updated'] as int?,
      owner: json['owner'] as String?,
      name: json['name'] as String,
      description: json['description'] as String,
      count: json['count'] as int,
      cost: (json['cost'] as num).toDouble(),
      isAvailable: json['isAvailable'] as bool,
      productUrl: json['productUrl'] as String,
      image: json['image'] as String,
      likeModel: json['likeModel'] == null
          ? null
          : LikeModel.fromJson(json['likeModel'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_ProductModelToJson(_$_ProductModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'objectId': instance.objectId,
      'created': instance.created,
      'updated': instance.updated,
      'owner': instance.owner,
      'name': instance.name,
      'description': instance.description,
      'count': instance.count,
      'cost': instance.cost,
      'isAvailable': instance.isAvailable,
      'productUrl': instance.productUrl,
      'image': instance.image,
      'likeModel': instance.likeModel?.toJson(),
    };
