// ignore_for_file: non_constant_identifier_names

import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_model.freezed.dart';
part 'user_model.g.dart';

@freezed
class UserModel with _$UserModel {

  @JsonSerializable(explicitToJson: true)
  const factory UserModel({
    required String objectId,
    required String firstname,
    required String lastname,
    required String? avatar,
    required double coins,
    required String identifier,
    required int remaining_invites,
    required int date_of_birth,
    required String email,
    required String phone_number
  }) = _UserModel;

  const UserModel._();

  Map<String, dynamic> toJsonForUpdate() {
    return <String, dynamic>{
      "firstname": firstname,
      "lastname": lastname,
      "avatar": avatar,
      "identifier": identifier,
      "date_of_birth": date_of_birth,
      "phone_number": phone_number,
    };
  }

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);
}