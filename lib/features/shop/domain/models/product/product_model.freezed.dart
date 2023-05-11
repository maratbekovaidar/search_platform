// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'product_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ProductModel _$ProductModelFromJson(Map<String, dynamic> json) {
  return _ProductModel.fromJson(json);
}

/// @nodoc
mixin _$ProductModel {
  int get id => throw _privateConstructorUsedError;
  String get objectId => throw _privateConstructorUsedError;
  int get created => throw _privateConstructorUsedError;
  int? get updated => throw _privateConstructorUsedError;
  String? get owner => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  int get count => throw _privateConstructorUsedError;
  double get cost => throw _privateConstructorUsedError;
  bool get isAvailable => throw _privateConstructorUsedError;
  String get productUrl => throw _privateConstructorUsedError;
  String get image => throw _privateConstructorUsedError;
  LikeModel? get likeModel => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ProductModelCopyWith<ProductModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProductModelCopyWith<$Res> {
  factory $ProductModelCopyWith(
          ProductModel value, $Res Function(ProductModel) then) =
      _$ProductModelCopyWithImpl<$Res, ProductModel>;
  @useResult
  $Res call(
      {int id,
      String objectId,
      int created,
      int? updated,
      String? owner,
      String name,
      String description,
      int count,
      double cost,
      bool isAvailable,
      String productUrl,
      String image,
      LikeModel? likeModel});

  $LikeModelCopyWith<$Res>? get likeModel;
}

/// @nodoc
class _$ProductModelCopyWithImpl<$Res, $Val extends ProductModel>
    implements $ProductModelCopyWith<$Res> {
  _$ProductModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? objectId = null,
    Object? created = null,
    Object? updated = freezed,
    Object? owner = freezed,
    Object? name = null,
    Object? description = null,
    Object? count = null,
    Object? cost = null,
    Object? isAvailable = null,
    Object? productUrl = null,
    Object? image = null,
    Object? likeModel = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      objectId: null == objectId
          ? _value.objectId
          : objectId // ignore: cast_nullable_to_non_nullable
              as String,
      created: null == created
          ? _value.created
          : created // ignore: cast_nullable_to_non_nullable
              as int,
      updated: freezed == updated
          ? _value.updated
          : updated // ignore: cast_nullable_to_non_nullable
              as int?,
      owner: freezed == owner
          ? _value.owner
          : owner // ignore: cast_nullable_to_non_nullable
              as String?,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      count: null == count
          ? _value.count
          : count // ignore: cast_nullable_to_non_nullable
              as int,
      cost: null == cost
          ? _value.cost
          : cost // ignore: cast_nullable_to_non_nullable
              as double,
      isAvailable: null == isAvailable
          ? _value.isAvailable
          : isAvailable // ignore: cast_nullable_to_non_nullable
              as bool,
      productUrl: null == productUrl
          ? _value.productUrl
          : productUrl // ignore: cast_nullable_to_non_nullable
              as String,
      image: null == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String,
      likeModel: freezed == likeModel
          ? _value.likeModel
          : likeModel // ignore: cast_nullable_to_non_nullable
              as LikeModel?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $LikeModelCopyWith<$Res>? get likeModel {
    if (_value.likeModel == null) {
      return null;
    }

    return $LikeModelCopyWith<$Res>(_value.likeModel!, (value) {
      return _then(_value.copyWith(likeModel: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_ProductModelCopyWith<$Res>
    implements $ProductModelCopyWith<$Res> {
  factory _$$_ProductModelCopyWith(
          _$_ProductModel value, $Res Function(_$_ProductModel) then) =
      __$$_ProductModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      String objectId,
      int created,
      int? updated,
      String? owner,
      String name,
      String description,
      int count,
      double cost,
      bool isAvailable,
      String productUrl,
      String image,
      LikeModel? likeModel});

  @override
  $LikeModelCopyWith<$Res>? get likeModel;
}

/// @nodoc
class __$$_ProductModelCopyWithImpl<$Res>
    extends _$ProductModelCopyWithImpl<$Res, _$_ProductModel>
    implements _$$_ProductModelCopyWith<$Res> {
  __$$_ProductModelCopyWithImpl(
      _$_ProductModel _value, $Res Function(_$_ProductModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? objectId = null,
    Object? created = null,
    Object? updated = freezed,
    Object? owner = freezed,
    Object? name = null,
    Object? description = null,
    Object? count = null,
    Object? cost = null,
    Object? isAvailable = null,
    Object? productUrl = null,
    Object? image = null,
    Object? likeModel = freezed,
  }) {
    return _then(_$_ProductModel(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      objectId: null == objectId
          ? _value.objectId
          : objectId // ignore: cast_nullable_to_non_nullable
              as String,
      created: null == created
          ? _value.created
          : created // ignore: cast_nullable_to_non_nullable
              as int,
      updated: freezed == updated
          ? _value.updated
          : updated // ignore: cast_nullable_to_non_nullable
              as int?,
      owner: freezed == owner
          ? _value.owner
          : owner // ignore: cast_nullable_to_non_nullable
              as String?,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      count: null == count
          ? _value.count
          : count // ignore: cast_nullable_to_non_nullable
              as int,
      cost: null == cost
          ? _value.cost
          : cost // ignore: cast_nullable_to_non_nullable
              as double,
      isAvailable: null == isAvailable
          ? _value.isAvailable
          : isAvailable // ignore: cast_nullable_to_non_nullable
              as bool,
      productUrl: null == productUrl
          ? _value.productUrl
          : productUrl // ignore: cast_nullable_to_non_nullable
              as String,
      image: null == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String,
      likeModel: freezed == likeModel
          ? _value.likeModel
          : likeModel // ignore: cast_nullable_to_non_nullable
              as LikeModel?,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$_ProductModel with DiagnosticableTreeMixin implements _ProductModel {
  const _$_ProductModel(
      {required this.id,
      required this.objectId,
      required this.created,
      required this.updated,
      required this.owner,
      required this.name,
      required this.description,
      required this.count,
      required this.cost,
      required this.isAvailable,
      required this.productUrl,
      required this.image,
      required this.likeModel});

  factory _$_ProductModel.fromJson(Map<String, dynamic> json) =>
      _$$_ProductModelFromJson(json);

  @override
  final int id;
  @override
  final String objectId;
  @override
  final int created;
  @override
  final int? updated;
  @override
  final String? owner;
  @override
  final String name;
  @override
  final String description;
  @override
  final int count;
  @override
  final double cost;
  @override
  final bool isAvailable;
  @override
  final String productUrl;
  @override
  final String image;
  @override
  final LikeModel? likeModel;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ProductModel(id: $id, objectId: $objectId, created: $created, updated: $updated, owner: $owner, name: $name, description: $description, count: $count, cost: $cost, isAvailable: $isAvailable, productUrl: $productUrl, image: $image, likeModel: $likeModel)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'ProductModel'))
      ..add(DiagnosticsProperty('id', id))
      ..add(DiagnosticsProperty('objectId', objectId))
      ..add(DiagnosticsProperty('created', created))
      ..add(DiagnosticsProperty('updated', updated))
      ..add(DiagnosticsProperty('owner', owner))
      ..add(DiagnosticsProperty('name', name))
      ..add(DiagnosticsProperty('description', description))
      ..add(DiagnosticsProperty('count', count))
      ..add(DiagnosticsProperty('cost', cost))
      ..add(DiagnosticsProperty('isAvailable', isAvailable))
      ..add(DiagnosticsProperty('productUrl', productUrl))
      ..add(DiagnosticsProperty('image', image))
      ..add(DiagnosticsProperty('likeModel', likeModel));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ProductModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.objectId, objectId) ||
                other.objectId == objectId) &&
            (identical(other.created, created) || other.created == created) &&
            (identical(other.updated, updated) || other.updated == updated) &&
            (identical(other.owner, owner) || other.owner == owner) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.count, count) || other.count == count) &&
            (identical(other.cost, cost) || other.cost == cost) &&
            (identical(other.isAvailable, isAvailable) ||
                other.isAvailable == isAvailable) &&
            (identical(other.productUrl, productUrl) ||
                other.productUrl == productUrl) &&
            (identical(other.image, image) || other.image == image) &&
            (identical(other.likeModel, likeModel) ||
                other.likeModel == likeModel));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      objectId,
      created,
      updated,
      owner,
      name,
      description,
      count,
      cost,
      isAvailable,
      productUrl,
      image,
      likeModel);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ProductModelCopyWith<_$_ProductModel> get copyWith =>
      __$$_ProductModelCopyWithImpl<_$_ProductModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ProductModelToJson(
      this,
    );
  }
}

abstract class _ProductModel implements ProductModel {
  const factory _ProductModel(
      {required final int id,
      required final String objectId,
      required final int created,
      required final int? updated,
      required final String? owner,
      required final String name,
      required final String description,
      required final int count,
      required final double cost,
      required final bool isAvailable,
      required final String productUrl,
      required final String image,
      required final LikeModel? likeModel}) = _$_ProductModel;

  factory _ProductModel.fromJson(Map<String, dynamic> json) =
      _$_ProductModel.fromJson;

  @override
  int get id;
  @override
  String get objectId;
  @override
  int get created;
  @override
  int? get updated;
  @override
  String? get owner;
  @override
  String get name;
  @override
  String get description;
  @override
  int get count;
  @override
  double get cost;
  @override
  bool get isAvailable;
  @override
  String get productUrl;
  @override
  String get image;
  @override
  LikeModel? get likeModel;
  @override
  @JsonKey(ignore: true)
  _$$_ProductModelCopyWith<_$_ProductModel> get copyWith =>
      throw _privateConstructorUsedError;
}
