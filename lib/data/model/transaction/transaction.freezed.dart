// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'transaction.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Transaction _$TransactionFromJson(Map<String, dynamic> json) {
  return _Transaction.fromJson(json);
}

/// @nodoc
mixin _$Transaction {
  String get id => throw _privateConstructorUsedError;
  String get productName => throw _privateConstructorUsedError;
  String get warehouseName => throw _privateConstructorUsedError;
  String? get infoPrice => throw _privateConstructorUsedError;
  String? get infoQuantity => throw _privateConstructorUsedError;
  String get createdAt => throw _privateConstructorUsedError;
  String get idTransaction => throw _privateConstructorUsedError;
  String get userId => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TransactionCopyWith<Transaction> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TransactionCopyWith<$Res> {
  factory $TransactionCopyWith(
          Transaction value, $Res Function(Transaction) then) =
      _$TransactionCopyWithImpl<$Res, Transaction>;
  @useResult
  $Res call(
      {String id,
      String productName,
      String warehouseName,
      String? infoPrice,
      String? infoQuantity,
      String createdAt,
      String idTransaction,
      String userId});
}

/// @nodoc
class _$TransactionCopyWithImpl<$Res, $Val extends Transaction>
    implements $TransactionCopyWith<$Res> {
  _$TransactionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? productName = null,
    Object? warehouseName = null,
    Object? infoPrice = freezed,
    Object? infoQuantity = freezed,
    Object? createdAt = null,
    Object? idTransaction = null,
    Object? userId = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      productName: null == productName
          ? _value.productName
          : productName // ignore: cast_nullable_to_non_nullable
              as String,
      warehouseName: null == warehouseName
          ? _value.warehouseName
          : warehouseName // ignore: cast_nullable_to_non_nullable
              as String,
      infoPrice: freezed == infoPrice
          ? _value.infoPrice
          : infoPrice // ignore: cast_nullable_to_non_nullable
              as String?,
      infoQuantity: freezed == infoQuantity
          ? _value.infoQuantity
          : infoQuantity // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String,
      idTransaction: null == idTransaction
          ? _value.idTransaction
          : idTransaction // ignore: cast_nullable_to_non_nullable
              as String,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_TransactionCopyWith<$Res>
    implements $TransactionCopyWith<$Res> {
  factory _$$_TransactionCopyWith(
          _$_Transaction value, $Res Function(_$_Transaction) then) =
      __$$_TransactionCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String productName,
      String warehouseName,
      String? infoPrice,
      String? infoQuantity,
      String createdAt,
      String idTransaction,
      String userId});
}

/// @nodoc
class __$$_TransactionCopyWithImpl<$Res>
    extends _$TransactionCopyWithImpl<$Res, _$_Transaction>
    implements _$$_TransactionCopyWith<$Res> {
  __$$_TransactionCopyWithImpl(
      _$_Transaction _value, $Res Function(_$_Transaction) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? productName = null,
    Object? warehouseName = null,
    Object? infoPrice = freezed,
    Object? infoQuantity = freezed,
    Object? createdAt = null,
    Object? idTransaction = null,
    Object? userId = null,
  }) {
    return _then(_$_Transaction(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      productName: null == productName
          ? _value.productName
          : productName // ignore: cast_nullable_to_non_nullable
              as String,
      warehouseName: null == warehouseName
          ? _value.warehouseName
          : warehouseName // ignore: cast_nullable_to_non_nullable
              as String,
      infoPrice: freezed == infoPrice
          ? _value.infoPrice
          : infoPrice // ignore: cast_nullable_to_non_nullable
              as String?,
      infoQuantity: freezed == infoQuantity
          ? _value.infoQuantity
          : infoQuantity // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String,
      idTransaction: null == idTransaction
          ? _value.idTransaction
          : idTransaction // ignore: cast_nullable_to_non_nullable
              as String,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Transaction implements _Transaction {
  const _$_Transaction(
      {this.id = "",
      this.productName = "",
      this.warehouseName = "",
      this.infoPrice = "",
      this.infoQuantity = "",
      this.createdAt = "",
      this.idTransaction = "",
      this.userId = ""});

  factory _$_Transaction.fromJson(Map<String, dynamic> json) =>
      _$$_TransactionFromJson(json);

  @override
  @JsonKey()
  final String id;
  @override
  @JsonKey()
  final String productName;
  @override
  @JsonKey()
  final String warehouseName;
  @override
  @JsonKey()
  final String? infoPrice;
  @override
  @JsonKey()
  final String? infoQuantity;
  @override
  @JsonKey()
  final String createdAt;
  @override
  @JsonKey()
  final String idTransaction;
  @override
  @JsonKey()
  final String userId;

  @override
  String toString() {
    return 'Transaction(id: $id, productName: $productName, warehouseName: $warehouseName, infoPrice: $infoPrice, infoQuantity: $infoQuantity, createdAt: $createdAt, idTransaction: $idTransaction, userId: $userId)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Transaction &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.productName, productName) ||
                other.productName == productName) &&
            (identical(other.warehouseName, warehouseName) ||
                other.warehouseName == warehouseName) &&
            (identical(other.infoPrice, infoPrice) ||
                other.infoPrice == infoPrice) &&
            (identical(other.infoQuantity, infoQuantity) ||
                other.infoQuantity == infoQuantity) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.idTransaction, idTransaction) ||
                other.idTransaction == idTransaction) &&
            (identical(other.userId, userId) || other.userId == userId));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, productName, warehouseName,
      infoPrice, infoQuantity, createdAt, idTransaction, userId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_TransactionCopyWith<_$_Transaction> get copyWith =>
      __$$_TransactionCopyWithImpl<_$_Transaction>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_TransactionToJson(
      this,
    );
  }
}

abstract class _Transaction implements Transaction {
  const factory _Transaction(
      {final String id,
      final String productName,
      final String warehouseName,
      final String? infoPrice,
      final String? infoQuantity,
      final String createdAt,
      final String idTransaction,
      final String userId}) = _$_Transaction;

  factory _Transaction.fromJson(Map<String, dynamic> json) =
      _$_Transaction.fromJson;

  @override
  String get id;
  @override
  String get productName;
  @override
  String get warehouseName;
  @override
  String? get infoPrice;
  @override
  String? get infoQuantity;
  @override
  String get createdAt;
  @override
  String get idTransaction;
  @override
  String get userId;
  @override
  @JsonKey(ignore: true)
  _$$_TransactionCopyWith<_$_Transaction> get copyWith =>
      throw _privateConstructorUsedError;
}
