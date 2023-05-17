// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'organization_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_OrganizationModel _$$_OrganizationModelFromJson(Map<String, dynamic> json) =>
    _$_OrganizationModel(
      id: json['id'] as int,
      bin: json['bin'] as String,
      nameKk: json['nameKk'] as String,
      nameRu: json['nameRu'] as String,
      nameEn: json['nameEn'] as String,
      organizationType:
          $enumDecode(_$OrganizationTypeEnumMap, json['organizationType']),
    );

Map<String, dynamic> _$$_OrganizationModelToJson(
        _$_OrganizationModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'bin': instance.bin,
      'nameKk': instance.nameKk,
      'nameRu': instance.nameRu,
      'nameEn': instance.nameEn,
      'organizationType': _$OrganizationTypeEnumMap[instance.organizationType]!,
    };

const _$OrganizationTypeEnumMap = {
  OrganizationType.UNIVERSITY: 'UNIVERSITY',
};
