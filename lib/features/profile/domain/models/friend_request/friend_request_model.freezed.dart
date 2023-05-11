// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'friend_request_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

FriendRequestModel _$FriendRequestModelFromJson(Map<String, dynamic> json) {
  return _FriendRequestModel.fromJson(json);
}

/// @nodoc
mixin _$FriendRequestModel {
  int get created => throw _privateConstructorUsedError;
  List<UserModel> get from => throw _privateConstructorUsedError;
  List<UserModel> get to => throw _privateConstructorUsedError;
  int get id => throw _privateConstructorUsedError;
  int? get updated => throw _privateConstructorUsedError;
  String get objectId => throw _privateConstructorUsedError;
  Status get status => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $FriendRequestModelCopyWith<FriendRequestModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FriendRequestModelCopyWith<$Res> {
  factory $FriendRequestModelCopyWith(
          FriendRequestModel value, $Res Function(FriendRequestModel) then) =
      _$FriendRequestModelCopyWithImpl<$Res, FriendRequestModel>;
  @useResult
  $Res call(
      {int created,
      List<UserModel> from,
      List<UserModel> to,
      int id,
      int? updated,
      String objectId,
      Status status});
}

/// @nodoc
class _$FriendRequestModelCopyWithImpl<$Res, $Val extends FriendRequestModel>
    implements $FriendRequestModelCopyWith<$Res> {
  _$FriendRequestModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? created = null,
    Object? from = null,
    Object? to = null,
    Object? id = null,
    Object? updated = freezed,
    Object? objectId = null,
    Object? status = null,
  }) {
    return _then(_value.copyWith(
      created: null == created
          ? _value.created
          : created // ignore: cast_nullable_to_non_nullable
              as int,
      from: null == from
          ? _value.from
          : from // ignore: cast_nullable_to_non_nullable
              as List<UserModel>,
      to: null == to
          ? _value.to
          : to // ignore: cast_nullable_to_non_nullable
              as List<UserModel>,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      updated: freezed == updated
          ? _value.updated
          : updated // ignore: cast_nullable_to_non_nullable
              as int?,
      objectId: null == objectId
          ? _value.objectId
          : objectId // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as Status,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_FriendRequestModelCopyWith<$Res>
    implements $FriendRequestModelCopyWith<$Res> {
  factory _$$_FriendRequestModelCopyWith(_$_FriendRequestModel value,
          $Res Function(_$_FriendRequestModel) then) =
      __$$_FriendRequestModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int created,
      List<UserModel> from,
      List<UserModel> to,
      int id,
      int? updated,
      String objectId,
      Status status});
}

/// @nodoc
class __$$_FriendRequestModelCopyWithImpl<$Res>
    extends _$FriendRequestModelCopyWithImpl<$Res, _$_FriendRequestModel>
    implements _$$_FriendRequestModelCopyWith<$Res> {
  __$$_FriendRequestModelCopyWithImpl(
      _$_FriendRequestModel _value, $Res Function(_$_FriendRequestModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? created = null,
    Object? from = null,
    Object? to = null,
    Object? id = null,
    Object? updated = freezed,
    Object? objectId = null,
    Object? status = null,
  }) {
    return _then(_$_FriendRequestModel(
      created: null == created
          ? _value.created
          : created // ignore: cast_nullable_to_non_nullable
              as int,
      from: null == from
          ? _value._from
          : from // ignore: cast_nullable_to_non_nullable
              as List<UserModel>,
      to: null == to
          ? _value._to
          : to // ignore: cast_nullable_to_non_nullable
              as List<UserModel>,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      updated: freezed == updated
          ? _value.updated
          : updated // ignore: cast_nullable_to_non_nullable
              as int?,
      objectId: null == objectId
          ? _value.objectId
          : objectId // ignore: cast_nullable_to_non_nullable
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
class _$_FriendRequestModel implements _FriendRequestModel {
  const _$_FriendRequestModel(
      {required this.created,
      required final List<UserModel> from,
      required final List<UserModel> to,
      required this.id,
      required this.updated,
      required this.objectId,
      required this.status})
      : _from = from,
        _to = to;

  factory _$_FriendRequestModel.fromJson(Map<String, dynamic> json) =>
      _$$_FriendRequestModelFromJson(json);

  @override
  final int created;
  final List<UserModel> _from;
  @override
  List<UserModel> get from {
    if (_from is EqualUnmodifiableListView) return _from;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_from);
  }

  final List<UserModel> _to;
  @override
  List<UserModel> get to {
    if (_to is EqualUnmodifiableListView) return _to;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_to);
  }

  @override
  final int id;
  @override
  final int? updated;
  @override
  final String objectId;
  @override
  final Status status;

  @override
  String toString() {
    return 'FriendRequestModel(created: $created, from: $from, to: $to, id: $id, updated: $updated, objectId: $objectId, status: $status)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_FriendRequestModel &&
            (identical(other.created, created) || other.created == created) &&
            const DeepCollectionEquality().equals(other._from, _from) &&
            const DeepCollectionEquality().equals(other._to, _to) &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.updated, updated) || other.updated == updated) &&
            (identical(other.objectId, objectId) ||
                other.objectId == objectId) &&
            (identical(other.status, status) || other.status == status));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      created,
      const DeepCollectionEquality().hash(_from),
      const DeepCollectionEquality().hash(_to),
      id,
      updated,
      objectId,
      status);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_FriendRequestModelCopyWith<_$_FriendRequestModel> get copyWith =>
      __$$_FriendRequestModelCopyWithImpl<_$_FriendRequestModel>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_FriendRequestModelToJson(
      this,
    );
  }
}

abstract class _FriendRequestModel implements FriendRequestModel {
  const factory _FriendRequestModel(
      {required final int created,
      required final List<UserModel> from,
      required final List<UserModel> to,
      required final int id,
      required final int? updated,
      required final String objectId,
      required final Status status}) = _$_FriendRequestModel;

  factory _FriendRequestModel.fromJson(Map<String, dynamic> json) =
      _$_FriendRequestModel.fromJson;

  @override
  int get created;
  @override
  List<UserModel> get from;
  @override
  List<UserModel> get to;
  @override
  int get id;
  @override
  int? get updated;
  @override
  String get objectId;
  @override
  Status get status;
  @override
  @JsonKey(ignore: true)
  _$$_FriendRequestModelCopyWith<_$_FriendRequestModel> get copyWith =>
      throw _privateConstructorUsedError;
}
