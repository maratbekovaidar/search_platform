// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'invite_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

InviteModel _$InviteModelFromJson(Map<String, dynamic> json) {
  return _InviteModel.fromJson(json);
}

/// @nodoc
mixin _$InviteModel {
  String get objectId => throw _privateConstructorUsedError;
  String? get ownerId => throw _privateConstructorUsedError;
  int get created => throw _privateConstructorUsedError;
  int? get updated => throw _privateConstructorUsedError;
  String get email => throw _privateConstructorUsedError;
  Status get status => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $InviteModelCopyWith<InviteModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $InviteModelCopyWith<$Res> {
  factory $InviteModelCopyWith(
          InviteModel value, $Res Function(InviteModel) then) =
      _$InviteModelCopyWithImpl<$Res, InviteModel>;
  @useResult
  $Res call(
      {String objectId,
      String? ownerId,
      int created,
      int? updated,
      String email,
      Status status});
}

/// @nodoc
class _$InviteModelCopyWithImpl<$Res, $Val extends InviteModel>
    implements $InviteModelCopyWith<$Res> {
  _$InviteModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? objectId = null,
    Object? ownerId = freezed,
    Object? created = null,
    Object? updated = freezed,
    Object? email = null,
    Object? status = null,
  }) {
    return _then(_value.copyWith(
      objectId: null == objectId
          ? _value.objectId
          : objectId // ignore: cast_nullable_to_non_nullable
              as String,
      ownerId: freezed == ownerId
          ? _value.ownerId
          : ownerId // ignore: cast_nullable_to_non_nullable
              as String?,
      created: null == created
          ? _value.created
          : created // ignore: cast_nullable_to_non_nullable
              as int,
      updated: freezed == updated
          ? _value.updated
          : updated // ignore: cast_nullable_to_non_nullable
              as int?,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as Status,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_InviteModelCopyWith<$Res>
    implements $InviteModelCopyWith<$Res> {
  factory _$$_InviteModelCopyWith(
          _$_InviteModel value, $Res Function(_$_InviteModel) then) =
      __$$_InviteModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String objectId,
      String? ownerId,
      int created,
      int? updated,
      String email,
      Status status});
}

/// @nodoc
class __$$_InviteModelCopyWithImpl<$Res>
    extends _$InviteModelCopyWithImpl<$Res, _$_InviteModel>
    implements _$$_InviteModelCopyWith<$Res> {
  __$$_InviteModelCopyWithImpl(
      _$_InviteModel _value, $Res Function(_$_InviteModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? objectId = null,
    Object? ownerId = freezed,
    Object? created = null,
    Object? updated = freezed,
    Object? email = null,
    Object? status = null,
  }) {
    return _then(_$_InviteModel(
      objectId: null == objectId
          ? _value.objectId
          : objectId // ignore: cast_nullable_to_non_nullable
              as String,
      ownerId: freezed == ownerId
          ? _value.ownerId
          : ownerId // ignore: cast_nullable_to_non_nullable
              as String?,
      created: null == created
          ? _value.created
          : created // ignore: cast_nullable_to_non_nullable
              as int,
      updated: freezed == updated
          ? _value.updated
          : updated // ignore: cast_nullable_to_non_nullable
              as int?,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as Status,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$_InviteModel implements _InviteModel {
  const _$_InviteModel(
      {required this.objectId,
      required this.ownerId,
      required this.created,
      required this.updated,
      required this.email,
      required this.status});

  factory _$_InviteModel.fromJson(Map<String, dynamic> json) =>
      _$$_InviteModelFromJson(json);

  @override
  final String objectId;
  @override
  final String? ownerId;
  @override
  final int created;
  @override
  final int? updated;
  @override
  final String email;
  @override
  final Status status;

  @override
  String toString() {
    return 'InviteModel(objectId: $objectId, ownerId: $ownerId, created: $created, updated: $updated, email: $email, status: $status)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_InviteModel &&
            (identical(other.objectId, objectId) ||
                other.objectId == objectId) &&
            (identical(other.ownerId, ownerId) || other.ownerId == ownerId) &&
            (identical(other.created, created) || other.created == created) &&
            (identical(other.updated, updated) || other.updated == updated) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.status, status) || other.status == status));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, objectId, ownerId, created, updated, email, status);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_InviteModelCopyWith<_$_InviteModel> get copyWith =>
      __$$_InviteModelCopyWithImpl<_$_InviteModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_InviteModelToJson(
      this,
    );
  }
}

abstract class _InviteModel implements InviteModel {
  const factory _InviteModel(
      {required final String objectId,
      required final String? ownerId,
      required final int created,
      required final int? updated,
      required final String email,
      required final Status status}) = _$_InviteModel;

  factory _InviteModel.fromJson(Map<String, dynamic> json) =
      _$_InviteModel.fromJson;

  @override
  String get objectId;
  @override
  String? get ownerId;
  @override
  int get created;
  @override
  int? get updated;
  @override
  String get email;
  @override
  Status get status;
  @override
  @JsonKey(ignore: true)
  _$$_InviteModelCopyWith<_$_InviteModel> get copyWith =>
      throw _privateConstructorUsedError;
}
