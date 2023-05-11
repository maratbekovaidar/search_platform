import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'initial_user_model.freezed.dart';
part 'initial_user_model.g.dart';

@freezed
class InitialUserModel with _$InitialUserModel {
  @JsonSerializable(explicitToJson: true)
  const factory InitialUserModel({
    required String objectId,
    required int lastLogin,
    required int created,
    required String ownerId,
    required String email,
  }) = _InitialUserModel;



  factory InitialUserModel.fromJson(Map<String, dynamic> json) =>
      _$InitialUserModelFromJson(json);
}