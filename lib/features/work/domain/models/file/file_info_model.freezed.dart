// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'file_info_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

FileInfoModel _$FileInfoModelFromJson(Map<String, dynamic> json) {
  return _FileInfoModel.fromJson(json);
}

/// @nodoc
mixin _$FileInfoModel {
  String get name => throw _privateConstructorUsedError;
  int get size => throw _privateConstructorUsedError;
  String get mimeType => throw _privateConstructorUsedError;
  String get hash => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $FileInfoModelCopyWith<FileInfoModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FileInfoModelCopyWith<$Res> {
  factory $FileInfoModelCopyWith(
          FileInfoModel value, $Res Function(FileInfoModel) then) =
      _$FileInfoModelCopyWithImpl<$Res, FileInfoModel>;
  @useResult
  $Res call({String name, int size, String mimeType, String hash});
}

/// @nodoc
class _$FileInfoModelCopyWithImpl<$Res, $Val extends FileInfoModel>
    implements $FileInfoModelCopyWith<$Res> {
  _$FileInfoModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? size = null,
    Object? mimeType = null,
    Object? hash = null,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      size: null == size
          ? _value.size
          : size // ignore: cast_nullable_to_non_nullable
              as int,
      mimeType: null == mimeType
          ? _value.mimeType
          : mimeType // ignore: cast_nullable_to_non_nullable
              as String,
      hash: null == hash
          ? _value.hash
          : hash // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_FileInfoModelCopyWith<$Res>
    implements $FileInfoModelCopyWith<$Res> {
  factory _$$_FileInfoModelCopyWith(
          _$_FileInfoModel value, $Res Function(_$_FileInfoModel) then) =
      __$$_FileInfoModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String name, int size, String mimeType, String hash});
}

/// @nodoc
class __$$_FileInfoModelCopyWithImpl<$Res>
    extends _$FileInfoModelCopyWithImpl<$Res, _$_FileInfoModel>
    implements _$$_FileInfoModelCopyWith<$Res> {
  __$$_FileInfoModelCopyWithImpl(
      _$_FileInfoModel _value, $Res Function(_$_FileInfoModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? size = null,
    Object? mimeType = null,
    Object? hash = null,
  }) {
    return _then(_$_FileInfoModel(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      size: null == size
          ? _value.size
          : size // ignore: cast_nullable_to_non_nullable
              as int,
      mimeType: null == mimeType
          ? _value.mimeType
          : mimeType // ignore: cast_nullable_to_non_nullable
              as String,
      hash: null == hash
          ? _value.hash
          : hash // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$_FileInfoModel with DiagnosticableTreeMixin implements _FileInfoModel {
  const _$_FileInfoModel(
      {required this.name,
      required this.size,
      required this.mimeType,
      required this.hash});

  factory _$_FileInfoModel.fromJson(Map<String, dynamic> json) =>
      _$$_FileInfoModelFromJson(json);

  @override
  final String name;
  @override
  final int size;
  @override
  final String mimeType;
  @override
  final String hash;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'FileInfoModel(name: $name, size: $size, mimeType: $mimeType, hash: $hash)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'FileInfoModel'))
      ..add(DiagnosticsProperty('name', name))
      ..add(DiagnosticsProperty('size', size))
      ..add(DiagnosticsProperty('mimeType', mimeType))
      ..add(DiagnosticsProperty('hash', hash));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_FileInfoModel &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.size, size) || other.size == size) &&
            (identical(other.mimeType, mimeType) ||
                other.mimeType == mimeType) &&
            (identical(other.hash, hash) || other.hash == hash));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, name, size, mimeType, hash);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_FileInfoModelCopyWith<_$_FileInfoModel> get copyWith =>
      __$$_FileInfoModelCopyWithImpl<_$_FileInfoModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_FileInfoModelToJson(
      this,
    );
  }
}

abstract class _FileInfoModel implements FileInfoModel {
  const factory _FileInfoModel(
      {required final String name,
      required final int size,
      required final String mimeType,
      required final String hash}) = _$_FileInfoModel;

  factory _FileInfoModel.fromJson(Map<String, dynamic> json) =
      _$_FileInfoModel.fromJson;

  @override
  String get name;
  @override
  int get size;
  @override
  String get mimeType;
  @override
  String get hash;
  @override
  @JsonKey(ignore: true)
  _$$_FileInfoModelCopyWith<_$_FileInfoModel> get copyWith =>
      throw _privateConstructorUsedError;
}
