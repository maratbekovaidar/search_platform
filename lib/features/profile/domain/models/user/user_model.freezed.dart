// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

UserModel _$UserModelFromJson(Map<String, dynamic> json) {
  return _UserModel.fromJson(json);
}

/// @nodoc
mixin _$UserModel {
  int get id => throw _privateConstructorUsedError;
  String get email => throw _privateConstructorUsedError;
  UserType get userType => throw _privateConstructorUsedError;
  String get phoneNumber => throw _privateConstructorUsedError;
  String get firstName => throw _privateConstructorUsedError;
  String get surname => throw _privateConstructorUsedError;
  String? get patronymic => throw _privateConstructorUsedError;
  String get birthDate => throw _privateConstructorUsedError;
  String? get avatar => throw _privateConstructorUsedError;
  ThesisStatus get thesisStatus => throw _privateConstructorUsedError;
  ProfileModel get profile => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserModelCopyWith<UserModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserModelCopyWith<$Res> {
  factory $UserModelCopyWith(UserModel value, $Res Function(UserModel) then) =
      _$UserModelCopyWithImpl<$Res, UserModel>;
  @useResult
  $Res call(
      {int id,
      String email,
      UserType userType,
      String phoneNumber,
      String firstName,
      String surname,
      String? patronymic,
      String birthDate,
      String? avatar,
      ThesisStatus thesisStatus,
      ProfileModel profile});

  $ProfileModelCopyWith<$Res> get profile;
}

/// @nodoc
class _$UserModelCopyWithImpl<$Res, $Val extends UserModel>
    implements $UserModelCopyWith<$Res> {
  _$UserModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? email = null,
    Object? userType = null,
    Object? phoneNumber = null,
    Object? firstName = null,
    Object? surname = null,
    Object? patronymic = freezed,
    Object? birthDate = null,
    Object? avatar = freezed,
    Object? thesisStatus = null,
    Object? profile = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      userType: null == userType
          ? _value.userType
          : userType // ignore: cast_nullable_to_non_nullable
              as UserType,
      phoneNumber: null == phoneNumber
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String,
      firstName: null == firstName
          ? _value.firstName
          : firstName // ignore: cast_nullable_to_non_nullable
              as String,
      surname: null == surname
          ? _value.surname
          : surname // ignore: cast_nullable_to_non_nullable
              as String,
      patronymic: freezed == patronymic
          ? _value.patronymic
          : patronymic // ignore: cast_nullable_to_non_nullable
              as String?,
      birthDate: null == birthDate
          ? _value.birthDate
          : birthDate // ignore: cast_nullable_to_non_nullable
              as String,
      avatar: freezed == avatar
          ? _value.avatar
          : avatar // ignore: cast_nullable_to_non_nullable
              as String?,
      thesisStatus: null == thesisStatus
          ? _value.thesisStatus
          : thesisStatus // ignore: cast_nullable_to_non_nullable
              as ThesisStatus,
      profile: null == profile
          ? _value.profile
          : profile // ignore: cast_nullable_to_non_nullable
              as ProfileModel,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $ProfileModelCopyWith<$Res> get profile {
    return $ProfileModelCopyWith<$Res>(_value.profile, (value) {
      return _then(_value.copyWith(profile: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_UserModelCopyWith<$Res> implements $UserModelCopyWith<$Res> {
  factory _$$_UserModelCopyWith(
          _$_UserModel value, $Res Function(_$_UserModel) then) =
      __$$_UserModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      String email,
      UserType userType,
      String phoneNumber,
      String firstName,
      String surname,
      String? patronymic,
      String birthDate,
      String? avatar,
      ThesisStatus thesisStatus,
      ProfileModel profile});

  @override
  $ProfileModelCopyWith<$Res> get profile;
}

/// @nodoc
class __$$_UserModelCopyWithImpl<$Res>
    extends _$UserModelCopyWithImpl<$Res, _$_UserModel>
    implements _$$_UserModelCopyWith<$Res> {
  __$$_UserModelCopyWithImpl(
      _$_UserModel _value, $Res Function(_$_UserModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? email = null,
    Object? userType = null,
    Object? phoneNumber = null,
    Object? firstName = null,
    Object? surname = null,
    Object? patronymic = freezed,
    Object? birthDate = null,
    Object? avatar = freezed,
    Object? thesisStatus = null,
    Object? profile = null,
  }) {
    return _then(_$_UserModel(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      userType: null == userType
          ? _value.userType
          : userType // ignore: cast_nullable_to_non_nullable
              as UserType,
      phoneNumber: null == phoneNumber
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String,
      firstName: null == firstName
          ? _value.firstName
          : firstName // ignore: cast_nullable_to_non_nullable
              as String,
      surname: null == surname
          ? _value.surname
          : surname // ignore: cast_nullable_to_non_nullable
              as String,
      patronymic: freezed == patronymic
          ? _value.patronymic
          : patronymic // ignore: cast_nullable_to_non_nullable
              as String?,
      birthDate: null == birthDate
          ? _value.birthDate
          : birthDate // ignore: cast_nullable_to_non_nullable
              as String,
      avatar: freezed == avatar
          ? _value.avatar
          : avatar // ignore: cast_nullable_to_non_nullable
              as String?,
      thesisStatus: null == thesisStatus
          ? _value.thesisStatus
          : thesisStatus // ignore: cast_nullable_to_non_nullable
              as ThesisStatus,
      profile: null == profile
          ? _value.profile
          : profile // ignore: cast_nullable_to_non_nullable
              as ProfileModel,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$_UserModel extends _UserModel with DiagnosticableTreeMixin {
  const _$_UserModel(
      {required this.id,
      required this.email,
      required this.userType,
      required this.phoneNumber,
      required this.firstName,
      required this.surname,
      required this.patronymic,
      required this.birthDate,
      required this.avatar,
      required this.thesisStatus,
      required this.profile})
      : super._();

  factory _$_UserModel.fromJson(Map<String, dynamic> json) =>
      _$$_UserModelFromJson(json);

  @override
  final int id;
  @override
  final String email;
  @override
  final UserType userType;
  @override
  final String phoneNumber;
  @override
  final String firstName;
  @override
  final String surname;
  @override
  final String? patronymic;
  @override
  final String birthDate;
  @override
  final String? avatar;
  @override
  final ThesisStatus thesisStatus;
  @override
  final ProfileModel profile;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'UserModel(id: $id, email: $email, userType: $userType, phoneNumber: $phoneNumber, firstName: $firstName, surname: $surname, patronymic: $patronymic, birthDate: $birthDate, avatar: $avatar, thesisStatus: $thesisStatus, profile: $profile)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'UserModel'))
      ..add(DiagnosticsProperty('id', id))
      ..add(DiagnosticsProperty('email', email))
      ..add(DiagnosticsProperty('userType', userType))
      ..add(DiagnosticsProperty('phoneNumber', phoneNumber))
      ..add(DiagnosticsProperty('firstName', firstName))
      ..add(DiagnosticsProperty('surname', surname))
      ..add(DiagnosticsProperty('patronymic', patronymic))
      ..add(DiagnosticsProperty('birthDate', birthDate))
      ..add(DiagnosticsProperty('avatar', avatar))
      ..add(DiagnosticsProperty('thesisStatus', thesisStatus))
      ..add(DiagnosticsProperty('profile', profile));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_UserModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.userType, userType) ||
                other.userType == userType) &&
            (identical(other.phoneNumber, phoneNumber) ||
                other.phoneNumber == phoneNumber) &&
            (identical(other.firstName, firstName) ||
                other.firstName == firstName) &&
            (identical(other.surname, surname) || other.surname == surname) &&
            (identical(other.patronymic, patronymic) ||
                other.patronymic == patronymic) &&
            (identical(other.birthDate, birthDate) ||
                other.birthDate == birthDate) &&
            (identical(other.avatar, avatar) || other.avatar == avatar) &&
            (identical(other.thesisStatus, thesisStatus) ||
                other.thesisStatus == thesisStatus) &&
            (identical(other.profile, profile) || other.profile == profile));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, email, userType, phoneNumber,
      firstName, surname, patronymic, birthDate, avatar, thesisStatus, profile);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_UserModelCopyWith<_$_UserModel> get copyWith =>
      __$$_UserModelCopyWithImpl<_$_UserModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_UserModelToJson(
      this,
    );
  }
}

abstract class _UserModel extends UserModel {
  const factory _UserModel(
      {required final int id,
      required final String email,
      required final UserType userType,
      required final String phoneNumber,
      required final String firstName,
      required final String surname,
      required final String? patronymic,
      required final String birthDate,
      required final String? avatar,
      required final ThesisStatus thesisStatus,
      required final ProfileModel profile}) = _$_UserModel;
  const _UserModel._() : super._();

  factory _UserModel.fromJson(Map<String, dynamic> json) =
      _$_UserModel.fromJson;

  @override
  int get id;
  @override
  String get email;
  @override
  UserType get userType;
  @override
  String get phoneNumber;
  @override
  String get firstName;
  @override
  String get surname;
  @override
  String? get patronymic;
  @override
  String get birthDate;
  @override
  String? get avatar;
  @override
  ThesisStatus get thesisStatus;
  @override
  ProfileModel get profile;
  @override
  @JsonKey(ignore: true)
  _$$_UserModelCopyWith<_$_UserModel> get copyWith =>
      throw _privateConstructorUsedError;
}
