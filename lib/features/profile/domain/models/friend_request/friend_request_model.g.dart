// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'friend_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_FriendRequestModel _$$_FriendRequestModelFromJson(
        Map<String, dynamic> json) =>
    _$_FriendRequestModel(
      created: json['created'] as int,
      from: (json['from'] as List<dynamic>)
          .map((e) => UserModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      to: (json['to'] as List<dynamic>)
          .map((e) => UserModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      id: json['id'] as int,
      updated: json['updated'] as int?,
      objectId: json['objectId'] as String,
      status: $enumDecode(_$StatusEnumMap, json['status']),
    );

Map<String, dynamic> _$$_FriendRequestModelToJson(
        _$_FriendRequestModel instance) =>
    <String, dynamic>{
      'created': instance.created,
      'from': instance.from.map((e) => e.toJson()).toList(),
      'to': instance.to.map((e) => e.toJson()).toList(),
      'id': instance.id,
      'updated': instance.updated,
      'objectId': instance.objectId,
      'status': _$StatusEnumMap[instance.status]!,
    };

const _$StatusEnumMap = {
  Status.PENDING: 'PENDING',
  Status.ACCEPTED: 'ACCEPTED',
  Status.DECLINED: 'DECLINED',
};
