import 'package:dsplatform/features/organization/domain/models/organization_type/organization_type.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'organization_model.freezed.dart';
part 'organization_model.g.dart';

@freezed
class OrganizationModel with _$OrganizationModel {
  @JsonSerializable(explicitToJson: true)
  const factory OrganizationModel({
    required int id,
    required String bin,
    required String nameKk,
    required String nameRu,
    required String nameEn,
    required OrganizationType organizationType
  }) = _OrganizationModel;


  factory OrganizationModel.fromJson(Map<String, dynamic> json) =>
      _$OrganizationModelFromJson(json);
}