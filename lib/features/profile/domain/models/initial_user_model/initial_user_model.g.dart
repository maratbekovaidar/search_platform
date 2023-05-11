// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'initial_user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_InitialUserModel _$$_InitialUserModelFromJson(Map<String, dynamic> json) =>
    _$_InitialUserModel(
      objectId: json['objectId'] as String,
      lastLogin: json['lastLogin'] as int,
      created: json['created'] as int,
      ownerId: json['ownerId'] as String,
      email: json['email'] as String,
    );

Map<String, dynamic> _$$_InitialUserModelToJson(_$_InitialUserModel instance) =>
    <String, dynamic>{
      'objectId': instance.objectId,
      'lastLogin': instance.lastLogin,
      'created': instance.created,
      'ownerId': instance.ownerId,
      'email': instance.email,
    };
