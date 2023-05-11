// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'invite_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_InviteModel _$$_InviteModelFromJson(Map<String, dynamic> json) =>
    _$_InviteModel(
      objectId: json['objectId'] as String,
      ownerId: json['ownerId'] as String?,
      created: json['created'] as int,
      updated: json['updated'] as int?,
      email: json['email'] as String,
      status: $enumDecode(_$StatusEnumMap, json['status']),
    );

Map<String, dynamic> _$$_InviteModelToJson(_$_InviteModel instance) =>
    <String, dynamic>{
      'objectId': instance.objectId,
      'ownerId': instance.ownerId,
      'created': instance.created,
      'updated': instance.updated,
      'email': instance.email,
      'status': _$StatusEnumMap[instance.status]!,
    };

const _$StatusEnumMap = {
  Status.PENDING: 'PENDING',
  Status.ACCEPTED: 'ACCEPTED',
  Status.DECLINED: 'DECLINED',
};
