// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ProfileModel _$$_ProfileModelFromJson(Map<String, dynamic> json) =>
    _$_ProfileModel(
      id: json['id'] as String,
      user: json['user'] as String,
      iin: json['iin'] as String,
      organization: OrganizationModel.fromJson(
          json['organization'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_ProfileModelToJson(_$_ProfileModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'user': instance.user,
      'iin': instance.iin,
      'organization': instance.organization.toJson(),
    };
