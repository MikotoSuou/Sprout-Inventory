// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'products_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ProductsState {
  ProductsStatus get status => throw _privateConstructorUsedError;
  List<Product> get products => throw _privateConstructorUsedError;
  int get page => throw _privateConstructorUsedError;
  bool get hasReachedMax => throw _privateConstructorUsedError;
  String get error => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ProductsStateCopyWith<ProductsState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProductsStateCopyWith<$Res> {
  factory $ProductsStateCopyWith(
          ProductsState value, $Res Function(ProductsState) then) =
      _$ProductsStateCopyWithImpl<$Res, ProductsState>;
  @useResult
  $Res call(
      {ProductsStatus status,
      List<Product> products,
      int page,
      bool hasReachedMax,
      String error});
}

/// @nodoc
class _$ProductsStateCopyWithImpl<$Res, $Val extends ProductsState>
    implements $ProductsStateCopyWith<$Res> {
  _$ProductsStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? products = null,
    Object? page = null,
    Object? hasReachedMax = null,
    Object? error = null,
  }) {
    return _then(_value.copyWith(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as ProductsStatus,
      products: null == products
          ? _value.products
          : products // ignore: cast_nullable_to_non_nullable
              as List<Product>,
      page: null == page
          ? _value.page
          : page // ignore: cast_nullable_to_non_nullable
              as int,
      hasReachedMax: null == hasReachedMax
          ? _value.hasReachedMax
          : hasReachedMax // ignore: cast_nullable_to_non_nullable
              as bool,
      error: null == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ProductsStateImplCopyWith<$Res>
    implements $ProductsStateCopyWith<$Res> {
  factory _$$ProductsStateImplCopyWith(
          _$ProductsStateImpl value, $Res Function(_$ProductsStateImpl) then) =
      __$$ProductsStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {ProductsStatus status,
      List<Product> products,
      int page,
      bool hasReachedMax,
      String error});
}

/// @nodoc
class __$$ProductsStateImplCopyWithImpl<$Res>
    extends _$ProductsStateCopyWithImpl<$Res, _$ProductsStateImpl>
    implements _$$ProductsStateImplCopyWith<$Res> {
  __$$ProductsStateImplCopyWithImpl(
      _$ProductsStateImpl _value, $Res Function(_$ProductsStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? products = null,
    Object? page = null,
    Object? hasReachedMax = null,
    Object? error = null,
  }) {
    return _then(_$ProductsStateImpl(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as ProductsStatus,
      products: null == products
          ? _value._products
          : products // ignore: cast_nullable_to_non_nullable
              as List<Product>,
      page: null == page
          ? _value.page
          : page // ignore: cast_nullable_to_non_nullable
              as int,
      hasReachedMax: null == hasReachedMax
          ? _value.hasReachedMax
          : hasReachedMax // ignore: cast_nullable_to_non_nullable
              as bool,
      error: null == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$ProductsStateImpl implements _ProductsState {
  const _$ProductsStateImpl(
      {this.status = ProductsStatus.loading,
      final List<Product> products = const [],
      this.page = 0,
      this.hasReachedMax = false,
      this.error = ''})
      : _products = products;

  @override
  @JsonKey()
  final ProductsStatus status;
  final List<Product> _products;
  @override
  @JsonKey()
  List<Product> get products {
    if (_products is EqualUnmodifiableListView) return _products;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_products);
  }

  @override
  @JsonKey()
  final int page;
  @override
  @JsonKey()
  final bool hasReachedMax;
  @override
  @JsonKey()
  final String error;

  @override
  String toString() {
    return 'ProductsState(status: $status, products: $products, page: $page, hasReachedMax: $hasReachedMax, error: $error)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProductsStateImpl &&
            (identical(other.status, status) || other.status == status) &&
            const DeepCollectionEquality().equals(other._products, _products) &&
            (identical(other.page, page) || other.page == page) &&
            (identical(other.hasReachedMax, hasReachedMax) ||
                other.hasReachedMax == hasReachedMax) &&
            (identical(other.error, error) || other.error == error));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      status,
      const DeepCollectionEquality().hash(_products),
      page,
      hasReachedMax,
      error);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ProductsStateImplCopyWith<_$ProductsStateImpl> get copyWith =>
      __$$ProductsStateImplCopyWithImpl<_$ProductsStateImpl>(this, _$identity);
}

abstract class _ProductsState implements ProductsState {
  const factory _ProductsState(
      {final ProductsStatus status,
      final List<Product> products,
      final int page,
      final bool hasReachedMax,
      final String error}) = _$ProductsStateImpl;

  @override
  ProductsStatus get status;
  @override
  List<Product> get products;
  @override
  int get page;
  @override
  bool get hasReachedMax;
  @override
  String get error;
  @override
  @JsonKey(ignore: true)
  _$$ProductsStateImplCopyWith<_$ProductsStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
