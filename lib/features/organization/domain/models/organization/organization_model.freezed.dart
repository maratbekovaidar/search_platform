// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'organization_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

OrganizationModel _$OrganizationModelFromJson(Map<String, dynamic> json) {
  return _OrganizationModel.fromJson(json);
}

/// @nodoc
mixin _$OrganizationModel {
  int get id => throw _privateConstructorUsedError;
  String get bin => throw _privateConstructorUsedError;
  String get nameKk => throw _privateConstructorUsedError;
  String get nameRu => throw _privateConstructorUsedError;
  String get nameEn => throw _privateConstructorUsedError;
  OrganizationType get organizationType => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $OrganizationModelCopyWith<OrganizationModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OrganizationModelCopyWith<$Res> {
  factory $OrganizationModelCopyWith(
          OrganizationModel value, $Res Function(OrganizationModel) then) =
      _$OrganizationModelCopyWithImpl<$Res, OrganizationModel>;
  @useResult
  $Res call(
      {int id,
      String bin,
      String nameKk,
      String nameRu,
      String nameEn,
      OrganizationType organizationType});
}

/// @nodoc
class _$OrganizationModelCopyWithImpl<$Res, $Val extends OrganizationModel>
    implements $OrganizationModelCopyWith<$Res> {
  _$OrganizationModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? bin = null,
    Object? nameKk = null,
    Object? nameRu = null,
    Object? nameEn = null,
    Object? organizationType = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      bin: null == bin
          ? _value.bin
          : bin // ignore: cast_nullable_to_non_nullable
              as String,
      nameKk: null == nameKk
          ? _value.nameKk
          : nameKk // ignore: cast_nullable_to_non_nullable
              as String,
      nameRu: null == nameRu
          ? _value.nameRu
          : nameRu // ignore: cast_nullable_to_non_nullable
              as String,
      nameEn: null == nameEn
          ? _value.nameEn
          : nameEn // ignore: cast_nullable_to_non_nullable
              as String,
      organizationType: null == organizationType
          ? _value.organizationType
          : organizationType // ignore: cast_nullable_to_non_nullable
              as OrganizationType,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_OrganizationModelCopyWith<$Res>
    implements $OrganizationModelCopyWith<$Res> {
  factory _$$_OrganizationModelCopyWith(_$_OrganizationModel value,
          $Res Function(_$_OrganizationModel) then) =
      __$$_OrganizationModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      String bin,
      String nameKk,
      String nameRu,
      String nameEn,
      OrganizationType organizationType});
}

/// @nodoc
class __$$_OrganizationModelCopyWithImpl<$Res>
    extends _$OrganizationModelCopyWithImpl<$Res, _$_OrganizationModel>
    implements _$$_OrganizationModelCopyWith<$Res> {
  __$$_OrganizationModelCopyWithImpl(
      _$_OrganizationModel _value, $Res Function(_$_OrganizationModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? bin = null,
    Object? nameKk = null,
    Object? nameRu = null,
    Object? nameEn = null,
    Object? organizationType = null,
  }) {
    return _then(_$_OrganizationModel(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      bin: null == bin
          ? _value.bin
          : bin // ignore: cast_nullable_to_non_nullable
              as String,
      nameKk: null == nameKk
          ? _value.nameKk
          : nameKk // ignore: cast_nullable_to_non_nullable
              as String,
      nameRu: null == nameRu
          ? _value.nameRu
          : nameRu // ignore: cast_nullable_to_non_nullable
              as String,
      nameEn: null == nameEn
          ? _value.nameEn
          : nameEn // ignore: cast_nullable_to_non_nullable
              as String,
      organizationType: null == organizationType
          ? _value.organizationType
          : organizationType // ignore: cast_nullable_to_non_nullable
              as OrganizationType,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$_OrganizationModel
    with DiagnosticableTreeMixin
    implements _OrganizationModel {
  const _$_OrganizationModel(
      {required this.id,
      required this.bin,
      required this.nameKk,
      required this.nameRu,
      required this.nameEn,
      required this.organizationType});

  factory _$_OrganizationModel.fromJson(Map<String, dynamic> json) =>
      _$$_OrganizationModelFromJson(json);

  @override
  final int id;
  @override
  final String bin;
  @override
  final String nameKk;
  @override
  final String nameRu;
  @override
  final String nameEn;
  @override
  final OrganizationType organizationType;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'OrganizationModel(id: $id, bin: $bin, nameKk: $nameKk, nameRu: $nameRu, nameEn: $nameEn, organizationType: $organizationType)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'OrganizationModel'))
      ..add(DiagnosticsProperty('id', id))
      ..add(DiagnosticsProperty('bin', bin))
      ..add(DiagnosticsProperty('nameKk', nameKk))
      ..add(DiagnosticsProperty('nameRu', nameRu))
      ..add(DiagnosticsProperty('nameEn', nameEn))
      ..add(DiagnosticsProperty('organizationType', organizationType));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_OrganizationModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.bin, bin) || other.bin == bin) &&
            (identical(other.nameKk, nameKk) || other.nameKk == nameKk) &&
            (identical(other.nameRu, nameRu) || other.nameRu == nameRu) &&
            (identical(other.nameEn, nameEn) || other.nameEn == nameEn) &&
            (identical(other.organizationType, organizationType) ||
                other.organizationType == organizationType));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, id, bin, nameKk, nameRu, nameEn, organizationType);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_OrganizationModelCopyWith<_$_OrganizationModel> get copyWith =>
      __$$_OrganizationModelCopyWithImpl<_$_OrganizationModel>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_OrganizationModelToJson(
      this,
    );
  }
}

abstract class _OrganizationModel implements OrganizationModel {
  const factory _OrganizationModel(
      {required final int id,
      required final String bin,
      required final String nameKk,
      required final String nameRu,
      required final String nameEn,
      required final OrganizationType organizationType}) = _$_OrganizationModel;

  factory _OrganizationModel.fromJson(Map<String, dynamic> json) =
      _$_OrganizationModel.fromJson;

  @override
  int get id;
  @override
  String get bin;
  @override
  String get nameKk;
  @override
  String get nameRu;
  @override
  String get nameEn;
  @override
  OrganizationType get organizationType;
  @override
  @JsonKey(ignore: true)
  _$$_OrganizationModelCopyWith<_$_OrganizationModel> get copyWith =>
      throw _privateConstructorUsedError;
}
