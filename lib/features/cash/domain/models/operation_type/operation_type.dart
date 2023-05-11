// ignore_for_file: constant_identifier_names

import 'package:freezed_annotation/freezed_annotation.dart';

enum OperationType {
  @JsonEnum(valueField: "REWARD")
  REWARD,
  @JsonEnum(valueField: "PURCHASE")
  PURCHASE,
  @JsonEnum(valueField: "PURCHASE_CANCELLATION")
  PURCHASE_CANCELLATION,
  @JsonEnum(valueField: "PROMO_CODE")
  PROMO_CODE,
  @JsonEnum(valueField: "REFERRAL")
  REFERRAL
}
