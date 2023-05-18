// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'file_info_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_FileInfoModel _$$_FileInfoModelFromJson(Map<String, dynamic> json) =>
    _$_FileInfoModel(
      name: json['name'] as String,
      size: json['size'] as int,
      mimeType: json['mimeType'] as String,
      hash: json['hash'] as String,
    );

Map<String, dynamic> _$$_FileInfoModelToJson(_$_FileInfoModel instance) =>
    <String, dynamic>{
      'name': instance.name,
      'size': instance.size,
      'mimeType': instance.mimeType,
      'hash': instance.hash,
    };
