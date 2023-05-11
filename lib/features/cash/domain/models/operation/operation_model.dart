import 'package:dsplatform/features/cash/domain/models/operation_type/operation_type.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'operation_model.freezed.dart';
part 'operation_model.g.dart';

@freezed
class OperationModel with _$OperationModel {
  @JsonSerializable(explicitToJson: true)
  const factory OperationModel({
    required int id,
    required String objectId,
    required String? ownerId,
    required int? updated,
    required int created,
    required int? steps,
    required double coins,
    required int? scoredSteps,
    required OperationType type,
    required String status

  }) = _OperationModel;



  factory OperationModel.fromJson(Map<String, dynamic> json) =>
      _$OperationModelFromJson(json);
}