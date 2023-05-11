import 'package:dsplatform/features/profile/domain/models/status_enum/status.dart';
import 'package:dsplatform/features/profile/domain/models/user/user_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'friend_request_model.freezed.dart';
part 'friend_request_model.g.dart';

@freezed
class FriendRequestModel with _$FriendRequestModel {
  @JsonSerializable(explicitToJson: true)
  const factory FriendRequestModel({
    required int created,
    required List<UserModel> from,
    required List<UserModel> to,
    required int id,
    required int? updated,
    required String objectId,
    required Status status
  }) = _FriendRequestModel;

  factory FriendRequestModel.fromJson(Map<String, dynamic> json) =>
      _$FriendRequestModelFromJson(json);
}