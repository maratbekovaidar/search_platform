// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_UserModel _$$_UserModelFromJson(Map<String, dynamic> json) => _$_UserModel(
      id: json['id'] as int,
      email: json['email'] as String,
      userType: $enumDecode(_$UserTypeEnumMap, json['userType']),
      phoneNumber: json['phoneNumber'] as String,
      firstName: json['firstName'] as String,
      surname: json['surname'] as String,
      patronymic: json['patronymic'] as String,
      birthDate: json['birthDate'] as String,
      avatar: json['avatar'] as String?,
      thesisStatus: $enumDecode(_$ThesisStatusEnumMap, json['thesisStatus']),
      profile: ProfileModel.fromJson(json['profile'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_UserModelToJson(_$_UserModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'email': instance.email,
      'userType': _$UserTypeEnumMap[instance.userType]!,
      'phoneNumber': instance.phoneNumber,
      'firstName': instance.firstName,
      'surname': instance.surname,
      'patronymic': instance.patronymic,
      'birthDate': instance.birthDate,
      'avatar': instance.avatar,
      'thesisStatus': _$ThesisStatusEnumMap[instance.thesisStatus]!,
      'profile': instance.profile.toJson(),
    };

const _$UserTypeEnumMap = {
  UserType.STUDENT: 'STUDENT',
  UserType.COMMISSION: 'COMMISSION',
  UserType.UNIVERSITY_ADMIN: 'UNIVERSITY_ADMIN',
  UserType.GUEST: 'GUEST',
};

const _$ThesisStatusEnumMap = {
  ThesisStatus.APPROVED: 'APPROVED',
  ThesisStatus.WAITING_APPROVED: 'WAITING_APPROVED',
  ThesisStatus.REJECTED: 'REJECTED',
};
