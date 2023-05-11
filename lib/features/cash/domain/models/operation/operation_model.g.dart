// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'operation_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_OperationModel _$$_OperationModelFromJson(Map<String, dynamic> json) =>
    _$_OperationModel(
      id: json['id'] as int,
      objectId: json['objectId'] as String,
      ownerId: json['ownerId'] as String?,
      updated: json['updated'] as int?,
      created: json['created'] as int,
      steps: json['steps'] as int?,
      coins: (json['coins'] as num).toDouble(),
      scoredSteps: json['scoredSteps'] as int?,
      type: $enumDecode(_$OperationTypeEnumMap, json['type']),
      status: json['status'] as String,
    );

Map<String, dynamic> _$$_OperationModelToJson(_$_OperationModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'objectId': instance.objectId,
      'ownerId': instance.ownerId,
      'updated': instance.updated,
      'created': instance.created,
      'steps': instance.steps,
      'coins': instance.coins,
      'scoredSteps': instance.scoredSteps,
      'type': _$OperationTypeEnumMap[instance.type]!,
      'status': instance.status,
    };

const _$OperationTypeEnumMap = {
  OperationType.REWARD: 'REWARD',
  OperationType.PURCHASE: 'PURCHASE',
  OperationType.PURCHASE_CANCELLATION: 'PURCHASE_CANCELLATION',
  OperationType.PROMO_CODE: 'PROMO_CODE',
  OperationType.REFERRAL: 'REFERRAL',
};
