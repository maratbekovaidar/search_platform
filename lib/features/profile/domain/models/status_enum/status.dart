// ignore_for_file: constant_identifier_names

import 'package:freezed_annotation/freezed_annotation.dart';

enum Status {
  @JsonEnum(valueField: "PENDING")
  PENDING,
  @JsonEnum(valueField: "ACCEPTED")
  ACCEPTED,
  @JsonEnum(valueField: "DECLINED")
  DECLINED
}