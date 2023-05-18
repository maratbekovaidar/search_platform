// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dissertation_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_DissertationModel _$$_DissertationModelFromJson(Map<String, dynamic> json) =>
    _$_DissertationModel(
      id: json['id'] as int,
      createdBy: json['createdBy'] as int,
      modifiedBy: json['modifiedBy'] as int,
      createdAt: json['createdAt'] as String,
      modifiedAt: json['modifiedAt'] as String,
      name: json['name'] as String,
      dissertAbstract: json['dissertAbstract'] as String,
      category: json['category'] as String,
      organizationName: json['organizationName'] as String,
      users: (json['users'] as List<dynamic>)
          .map((e) => UserModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      files: (json['files'] as List<dynamic>)
          .map((e) => FileInfoModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_DissertationModelToJson(
        _$_DissertationModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'createdBy': instance.createdBy,
      'modifiedBy': instance.modifiedBy,
      'createdAt': instance.createdAt,
      'modifiedAt': instance.modifiedAt,
      'name': instance.name,
      'dissertAbstract': instance.dissertAbstract,
      'category': instance.category,
      'organizationName': instance.organizationName,
      'users': instance.users.map((e) => e.toJson()).toList(),
      'files': instance.files.map((e) => e.toJson()).toList(),
    };
