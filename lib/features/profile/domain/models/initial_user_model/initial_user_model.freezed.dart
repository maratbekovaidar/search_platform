// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'initial_user_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

InitialUserModel _$InitialUserModelFromJson(Map<String, dynamic> json) {
  return _InitialUserModel.fromJson(json);
}

/// @nodoc
mixin _$InitialUserModel {
  String get objectId => throw _privateConstructorUsedError;
  int get lastLogin => throw _privateConstructorUsedError;
  int get created => throw _privateConstructorUsedError;
  String get ownerId => throw _privateConstructorUsedError;
  String get email => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $InitialUserModelCopyWith<InitialUserModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $InitialUserModelCopyWith<$Res> {
  factory $InitialUserModelCopyWith(
          InitialUserModel value, $Res Function(InitialUserModel) then) =
      _$InitialUserModelCopyWithImpl<$Res, InitialUserModel>;
  @useResult
  $Res call(
      {String objectId,
      int lastLogin,
      int created,
      String ownerId,
      String email});
}

/// @nodoc
class _$InitialUserModelCopyWithImpl<$Res, $Val extends InitialUserModel>
    implements $InitialUserModelCopyWith<$Res> {
  _$InitialUserModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? objectId = null,
    Object? lastLogin = null,
    Object? created = null,
    Object? ownerId = null,
    Object? email = null,
  }) {
    return _then(_value.copyWith(
      objectId: null == objectId
          ? _value.objectId
          : objectId // ignore: cast_nullable_to_non_nullable
              as String,
      lastLogin: null == lastLogin
          ? _value.lastLogin
          : lastLogin // ignore: cast_nullable_to_non_nullable
              as int,
      created: null == created
          ? _value.created
          : created // ignore: cast_nullable_to_non_nullable
              as int,
      ownerId: null == ownerId
          ? _value.ownerId
          : ownerId // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_InitialUserModelCopyWith<$Res>
    implements $InitialUserModelCopyWith<$Res> {
  factory _$$_InitialUserModelCopyWith(
          _$_InitialUserModel value, $Res Function(_$_InitialUserModel) then) =
      __$$_InitialUserModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String objectId,
      int lastLogin,
      int created,
      String ownerId,
      String email});
}

/// @nodoc
class __$$_InitialUserModelCopyWithImpl<$Res>
    extends _$InitialUserModelCopyWithImpl<$Res, _$_InitialUserModel>
    implements _$$_InitialUserModelCopyWith<$Res> {
  __$$_InitialUserModelCopyWithImpl(
      _$_InitialUserModel _value, $Res Function(_$_InitialUserModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? objectId = null,
    Object? lastLogin = null,
    Object? created = null,
    Object? ownerId = null,
    Object? email = null,
  }) {
    return _then(_$_InitialUserModel(
      objectId: null == objectId
          ? _value.objectId
          : objectId // ignore: cast_nullable_to_non_nullable
              as String,
      lastLogin: null == lastLogin
          ? _value.lastLogin
          : lastLogin // ignore: cast_nullable_to_non_nullable
              as int,
      created: null == created
          ? _value.created
          : created // ignore: cast_nullable_to_non_nullable
              as int,
      ownerId: null == ownerId
          ? _value.ownerId
          : ownerId // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$_InitialUserModel
    with DiagnosticableTreeMixin
    implements _InitialUserModel {
  const _$_InitialUserModel(
      {required this.objectId,
      required this.lastLogin,
      required this.created,
      required this.ownerId,
      required this.email});

  factory _$_InitialUserModel.fromJson(Map<String, dynamic> json) =>
      _$$_InitialUserModelFromJson(json);

  @override
  final String objectId;
  @override
  final int lastLogin;
  @override
  final int created;
  @override
  final String ownerId;
  @override
  final String email;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'InitialUserModel(objectId: $objectId, lastLogin: $lastLogin, created: $created, ownerId: $ownerId, email: $email)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'InitialUserModel'))
      ..add(DiagnosticsProperty('objectId', objectId))
      ..add(DiagnosticsProperty('lastLogin', lastLogin))
      ..add(DiagnosticsProperty('created', created))
      ..add(DiagnosticsProperty('ownerId', ownerId))
      ..add(DiagnosticsProperty('email', email));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_InitialUserModel &&
            (identical(other.objectId, objectId) ||
                other.objectId == objectId) &&
            (identical(other.lastLogin, lastLogin) ||
                other.lastLogin == lastLogin) &&
            (identical(other.created, created) || other.created == created) &&
            (identical(other.ownerId, ownerId) || other.ownerId == ownerId) &&
            (identical(other.email, email) || other.email == email));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, objectId, lastLogin, created, ownerId, email);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_InitialUserModelCopyWith<_$_InitialUserModel> get copyWith =>
      __$$_InitialUserModelCopyWithImpl<_$_InitialUserModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_InitialUserModelToJson(
      this,
    );
  }
}

abstract class _InitialUserModel implements InitialUserModel {
  const factory _InitialUserModel(
      {required final String objectId,
      required final int lastLogin,
      required final int created,
      required final String ownerId,
      required final String email}) = _$_InitialUserModel;

  factory _InitialUserModel.fromJson(Map<String, dynamic> json) =
      _$_InitialUserModel.fromJson;

  @override
  String get objectId;
  @override
  int get lastLogin;
  @override
  int get created;
  @override
  String get ownerId;
  @override
  String get email;
  @override
  @JsonKey(ignore: true)
  _$$_InitialUserModelCopyWith<_$_InitialUserModel> get copyWith =>
      throw _privateConstructorUsedError;
}
