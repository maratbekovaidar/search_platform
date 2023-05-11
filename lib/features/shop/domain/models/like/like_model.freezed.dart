// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'like_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

LikeModel _$LikeModelFromJson(Map<String, dynamic> json) {
  return _LikeModel.fromJson(json);
}

/// @nodoc
mixin _$LikeModel {
  int get count => throw _privateConstructorUsedError;
  bool get isLiked => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $LikeModelCopyWith<LikeModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LikeModelCopyWith<$Res> {
  factory $LikeModelCopyWith(LikeModel value, $Res Function(LikeModel) then) =
      _$LikeModelCopyWithImpl<$Res, LikeModel>;
  @useResult
  $Res call({int count, bool isLiked});
}

/// @nodoc
class _$LikeModelCopyWithImpl<$Res, $Val extends LikeModel>
    implements $LikeModelCopyWith<$Res> {
  _$LikeModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? count = null,
    Object? isLiked = null,
  }) {
    return _then(_value.copyWith(
      count: null == count
          ? _value.count
          : count // ignore: cast_nullable_to_non_nullable
              as int,
      isLiked: null == isLiked
          ? _value.isLiked
          : isLiked // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_LikeModelCopyWith<$Res> implements $LikeModelCopyWith<$Res> {
  factory _$$_LikeModelCopyWith(
          _$_LikeModel value, $Res Function(_$_LikeModel) then) =
      __$$_LikeModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int count, bool isLiked});
}

/// @nodoc
class __$$_LikeModelCopyWithImpl<$Res>
    extends _$LikeModelCopyWithImpl<$Res, _$_LikeModel>
    implements _$$_LikeModelCopyWith<$Res> {
  __$$_LikeModelCopyWithImpl(
      _$_LikeModel _value, $Res Function(_$_LikeModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? count = null,
    Object? isLiked = null,
  }) {
    return _then(_$_LikeModel(
      count: null == count
          ? _value.count
          : count // ignore: cast_nullable_to_non_nullable
              as int,
      isLiked: null == isLiked
          ? _value.isLiked
          : isLiked // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$_LikeModel with DiagnosticableTreeMixin implements _LikeModel {
  const _$_LikeModel({required this.count, required this.isLiked});

  factory _$_LikeModel.fromJson(Map<String, dynamic> json) =>
      _$$_LikeModelFromJson(json);

  @override
  final int count;
  @override
  final bool isLiked;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'LikeModel(count: $count, isLiked: $isLiked)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'LikeModel'))
      ..add(DiagnosticsProperty('count', count))
      ..add(DiagnosticsProperty('isLiked', isLiked));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_LikeModel &&
            (identical(other.count, count) || other.count == count) &&
            (identical(other.isLiked, isLiked) || other.isLiked == isLiked));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, count, isLiked);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_LikeModelCopyWith<_$_LikeModel> get copyWith =>
      __$$_LikeModelCopyWithImpl<_$_LikeModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_LikeModelToJson(
      this,
    );
  }
}

abstract class _LikeModel implements LikeModel {
  const factory _LikeModel(
      {required final int count, required final bool isLiked}) = _$_LikeModel;

  factory _LikeModel.fromJson(Map<String, dynamic> json) =
      _$_LikeModel.fromJson;

  @override
  int get count;
  @override
  bool get isLiked;
  @override
  @JsonKey(ignore: true)
  _$$_LikeModelCopyWith<_$_LikeModel> get copyWith =>
      throw _privateConstructorUsedError;
}
