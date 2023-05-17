// ignore_for_file: non_constant_identifier_names

import 'package:dsplatform/features/profile/domain/models/profile/profile_model.dart';
import 'package:dsplatform/features/profile/domain/models/thesis_status/thesis_status.dart';
import 'package:dsplatform/features/profile/domain/models/user_type/user_type.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_model.freezed.dart';
part 'user_model.g.dart';

@freezed
class UserModel with _$UserModel {

  @JsonSerializable(explicitToJson: true)
  const factory UserModel({
    required int id,
    required String email,
    required UserType userType,
    required String phoneNumber,
    required String firstName,
    required String surname,
    required String patronymic,
    required String birthDate,
    required String? avatar,
    required ThesisStatus thesisStatus,
    required ProfileModel profile,
  }) = _UserModel;

  const UserModel._();

  // Map<String, dynamic> toJsonForUpdate() {
  //   return <String, dynamic>{
  //     "firstname": firstname,
  //     "lastname": lastname,
  //     "avatar": avatar,
  //     "identifier": identifier,
  //     "date_of_birth": date_of_birth,
  //     "phone_number": phone_number,
  //   };
  // }

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);
}