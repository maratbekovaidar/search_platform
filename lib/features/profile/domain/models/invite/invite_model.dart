import 'package:dsplatform/features/profile/domain/models/status_enum/status.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'invite_model.freezed.dart';
part 'invite_model.g.dart';

@freezed
class InviteModel with _$InviteModel {
  @JsonSerializable(explicitToJson: true)
  const factory InviteModel({
    required String objectId,
    required String? ownerId,
    required int created,
    required int? updated,
    required String email,
    required Status status,
  }) = _InviteModel;
  


  factory InviteModel.fromJson(Map<String, dynamic> json) =>
      _$InviteModelFromJson(json);
}