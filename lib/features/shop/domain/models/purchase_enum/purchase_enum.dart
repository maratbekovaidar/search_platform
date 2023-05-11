// ignore_for_file: constant_identifier_names

import 'package:freezed_annotation/freezed_annotation.dart';

enum PurchaseEnum {
  @JsonEnum(valueField: "SUCCESS")
  SUCCESS,
  @JsonEnum(valueField: "NOT_ENOUGH_COST")
  NOT_ENOUGH_COST,
  @JsonEnum(valueField: "NOT_ENOUGH_COUNT")
  NOT_ENOUGH_COUNT,
  @JsonEnum(valueField: "UNKNOWN_FAILURE")
  UNKNOWN_FAILURE
}