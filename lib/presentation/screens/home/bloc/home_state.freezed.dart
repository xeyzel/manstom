// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'home_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$HomeState {
  Status get status => throw _privateConstructorUsedError;
  int get index => throw _privateConstructorUsedError;
  Iterable<Product> get products => throw _privateConstructorUsedError;
  Iterable<Product> get allProduct => throw _privateConstructorUsedError;
  Iterable<Product> get newProducts => throw _privateConstructorUsedError;
  Iterable<Transaction> get transactions => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $HomeStateCopyWith<HomeState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HomeStateCopyWith<$Res> {
  factory $HomeStateCopyWith(HomeState value, $Res Function(HomeState) then) =
      _$HomeStateCopyWithImpl<$Res, HomeState>;
  @useResult
  $Res call(
      {Status status,
      int index,
      Iterable<Product> products,
      Iterable<Product> allProduct,
      Iterable<Product> newProducts,
      Iterable<Transaction> transactions});
}

/// @nodoc
class _$HomeStateCopyWithImpl<$Res, $Val extends HomeState>
    implements $HomeStateCopyWith<$Res> {
  _$HomeStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? index = null,
    Object? products = null,
    Object? allProduct = null,
    Object? newProducts = null,
    Object? transactions = null,
  }) {
    return _then(_value.copyWith(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as Status,
      index: null == index
          ? _value.index
          : index // ignore: cast_nullable_to_non_nullable
              as int,
      products: null == products
          ? _value.products
          : products // ignore: cast_nullable_to_non_nullable
              as Iterable<Product>,
      allProduct: null == allProduct
          ? _value.allProduct
          : allProduct // ignore: cast_nullable_to_non_nullable
              as Iterable<Product>,
      newProducts: null == newProducts
          ? _value.newProducts
          : newProducts // ignore: cast_nullable_to_non_nullable
              as Iterable<Product>,
      transactions: null == transactions
          ? _value.transactions
          : transactions // ignore: cast_nullable_to_non_nullable
              as Iterable<Transaction>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_HomeStateCopyWith<$Res> implements $HomeStateCopyWith<$Res> {
  factory _$$_HomeStateCopyWith(
          _$_HomeState value, $Res Function(_$_HomeState) then) =
      __$$_HomeStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {Status status,
      int index,
      Iterable<Product> products,
      Iterable<Product> allProduct,
      Iterable<Product> newProducts,
      Iterable<Transaction> transactions});
}

/// @nodoc
class __$$_HomeStateCopyWithImpl<$Res>
    extends _$HomeStateCopyWithImpl<$Res, _$_HomeState>
    implements _$$_HomeStateCopyWith<$Res> {
  __$$_HomeStateCopyWithImpl(
      _$_HomeState _value, $Res Function(_$_HomeState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? index = null,
    Object? products = null,
    Object? allProduct = null,
    Object? newProducts = null,
    Object? transactions = null,
  }) {
    return _then(_$_HomeState(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as Status,
      index: null == index
          ? _value.index
          : index // ignore: cast_nullable_to_non_nullable
              as int,
      products: null == products
          ? _value.products
          : products // ignore: cast_nullable_to_non_nullable
              as Iterable<Product>,
      allProduct: null == allProduct
          ? _value.allProduct
          : allProduct // ignore: cast_nullable_to_non_nullable
              as Iterable<Product>,
      newProducts: null == newProducts
          ? _value.newProducts
          : newProducts // ignore: cast_nullable_to_non_nullable
              as Iterable<Product>,
      transactions: null == transactions
          ? _value.transactions
          : transactions // ignore: cast_nullable_to_non_nullable
              as Iterable<Transaction>,
    ));
  }
}

/// @nodoc

class _$_HomeState implements _HomeState {
  const _$_HomeState(
      {this.status = Status.initial,
      this.index = 0,
      this.products = const [],
      this.allProduct = const [],
      this.newProducts = const [],
      this.transactions = const []});

  @override
  @JsonKey()
  final Status status;
  @override
  @JsonKey()
  final int index;
  @override
  @JsonKey()
  final Iterable<Product> products;
  @override
  @JsonKey()
  final Iterable<Product> allProduct;
  @override
  @JsonKey()
  final Iterable<Product> newProducts;
  @override
  @JsonKey()
  final Iterable<Transaction> transactions;

  @override
  String toString() {
    return 'HomeState(status: $status, index: $index, products: $products, allProduct: $allProduct, newProducts: $newProducts, transactions: $transactions)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_HomeState &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.index, index) || other.index == index) &&
            const DeepCollectionEquality().equals(other.products, products) &&
            const DeepCollectionEquality()
                .equals(other.allProduct, allProduct) &&
            const DeepCollectionEquality()
                .equals(other.newProducts, newProducts) &&
            const DeepCollectionEquality()
                .equals(other.transactions, transactions));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      status,
      index,
      const DeepCollectionEquality().hash(products),
      const DeepCollectionEquality().hash(allProduct),
      const DeepCollectionEquality().hash(newProducts),
      const DeepCollectionEquality().hash(transactions));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_HomeStateCopyWith<_$_HomeState> get copyWith =>
      __$$_HomeStateCopyWithImpl<_$_HomeState>(this, _$identity);
}

abstract class _HomeState implements HomeState {
  const factory _HomeState(
      {final Status status,
      final int index,
      final Iterable<Product> products,
      final Iterable<Product> allProduct,
      final Iterable<Product> newProducts,
      final Iterable<Transaction> transactions}) = _$_HomeState;

  @override
  Status get status;
  @override
  int get index;
  @override
  Iterable<Product> get products;
  @override
  Iterable<Product> get allProduct;
  @override
  Iterable<Product> get newProducts;
  @override
  Iterable<Transaction> get transactions;
  @override
  @JsonKey(ignore: true)
  _$$_HomeStateCopyWith<_$_HomeState> get copyWith =>
      throw _privateConstructorUsedError;
}
