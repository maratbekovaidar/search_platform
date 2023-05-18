import 'package:dsplatform/features/profile/domain/models/user/user_model.dart';
import 'package:dsplatform/features/work/domain/models/file/file_info_model.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'dissertation_model.freezed.dart';
part 'dissertation_model.g.dart';

@freezed
class DissertationModel with _$DissertationModel {
  @JsonSerializable(explicitToJson: true)
  const factory DissertationModel({
    required int id,
    required int createdBy,
    required int modifiedBy,
    required String createdAt,
    required String modifiedAt,
    required String name,
    required String dissertAbstract,
    required String category,
    required String organizationName,
    required List<UserModel> users,
    required List<FileInfoModel> files
  }) = _DissertationModel;

  factory DissertationModel.fromJson(Map<String, dynamic> json) =>
      _$DissertationModelFromJson(json);
}