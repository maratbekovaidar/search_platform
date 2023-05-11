// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_UserModel _$$_UserModelFromJson(Map<String, dynamic> json) => _$_UserModel(
      objectId: json['objectId'] as String,
      firstname: json['firstname'] as String,
      lastname: json['lastname'] as String,
      avatar: json['avatar'] as String?,
      coins: (json['coins'] as num).toDouble(),
      identifier: json['identifier'] as String,
      remaining_invites: json['remaining_invites'] as int,
      date_of_birth: json['date_of_birth'] as int,
      email: json['email'] as String,
      phone_number: json['phone_number'] as String,
    );

Map<String, dynamic> _$$_UserModelToJson(_$_UserModel instance) =>
    <String, dynamic>{
      'objectId': instance.objectId,
      'firstname': instance.firstname,
      'lastname': instance.lastname,
      'avatar': instance.avatar,
      'coins': instance.coins,
      'identifier': instance.identifier,
      'remaining_invites': instance.remaining_invites,
      'date_of_birth': instance.date_of_birth,
      'email': instance.email,
      'phone_number': instance.phone_number,
    };
