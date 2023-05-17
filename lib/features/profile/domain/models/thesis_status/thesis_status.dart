
// ignore_for_file: constant_identifier_names

import 'package:freezed_annotation/freezed_annotation.dart';

enum ThesisStatus {
  @JsonEnum(valueField: "APPROVED")
  APPROVED,
  @JsonEnum(valueField: "WAITING_APPROVED")
  WAITING_APPROVED,
  @JsonEnum(valueField: "REJECTED")
  REJECTED
}