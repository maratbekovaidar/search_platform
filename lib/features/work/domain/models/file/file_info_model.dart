import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'file_info_model.freezed.dart';
part 'file_info_model.g.dart';

@freezed
class FileInfoModel with _$FileInfoModel {
  @JsonSerializable(explicitToJson: true)
  const factory FileInfoModel({
    required String name,
    required int size,
    required String mimeType,
    required String hash
  }) = _FileInfoModel;
  
  

  factory FileInfoModel.fromJson(Map<String, dynamic> json) =>
      _$FileInfoModelFromJson(json);
}