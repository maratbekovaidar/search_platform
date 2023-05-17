// ignore_for_file: constant_identifier_names



import 'package:json_annotation/json_annotation.dart';

enum UserType {
  @JsonEnum(valueField: "STUDENT")
  STUDENT,
  @JsonEnum(valueField: "COMMISSION")
  COMMISSION,
  @JsonEnum(valueField: "UNIVERSITY_ADMIN")
  UNIVERSITY_ADMIN,
  @JsonEnum(valueField: "GUEST")
  GUEST
}