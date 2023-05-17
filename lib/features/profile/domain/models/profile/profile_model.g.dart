// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ProfileModel _$$_ProfileModelFromJson(Map<String, dynamic> json) =>
    _$_ProfileModel(
      iin: json['iin'] as String,
      organization: OrganizationModel.fromJson(
          json['organization'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_ProfileModelToJson(_$_ProfileModel instance) =>
    <String, dynamic>{
      'iin': instance.iin,
      'organization': instance.organization.toJson(),
    };
