// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'create_warehouse_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$CreateWarehouseState {
  Status get status => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get address => throw _privateConstructorUsedError;
  String get message => throw _privateConstructorUsedError;
  Iterable<Warehouse> get warehouses => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $CreateWarehouseStateCopyWith<CreateWarehouseState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CreateWarehouseStateCopyWith<$Res> {
  factory $CreateWarehouseStateCopyWith(CreateWarehouseState value,
          $Res Function(CreateWarehouseState) then) =
      _$CreateWarehouseStateCopyWithImpl<$Res, CreateWarehouseState>;
  @useResult
  $Res call(
      {Status status,
      String name,
      String address,
      String message,
      Iterable<Warehouse> warehouses});
}

/// @nodoc
class _$CreateWarehouseStateCopyWithImpl<$Res,
        $Val extends CreateWarehouseState>
    implements $CreateWarehouseStateCopyWith<$Res> {
  _$CreateWarehouseStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? name = null,
    Object? address = null,
    Object? message = null,
    Object? warehouses = null,
  }) {
    return _then(_value.copyWith(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as Status,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      address: null == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      warehouses: null == warehouses
          ? _value.warehouses
          : warehouses // ignore: cast_nullable_to_non_nullable
              as Iterable<Warehouse>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_CreateWarehouseStateCopyWith<$Res>
    implements $CreateWarehouseStateCopyWith<$Res> {
  factory _$$_CreateWarehouseStateCopyWith(_$_CreateWarehouseState value,
          $Res Function(_$_CreateWarehouseState) then) =
      __$$_CreateWarehouseStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {Status status,
      String name,
      String address,
      String message,
      Iterable<Warehouse> warehouses});
}

/// @nodoc
class __$$_CreateWarehouseStateCopyWithImpl<$Res>
    extends _$CreateWarehouseStateCopyWithImpl<$Res, _$_CreateWarehouseState>
    implements _$$_CreateWarehouseStateCopyWith<$Res> {
  __$$_CreateWarehouseStateCopyWithImpl(_$_CreateWarehouseState _value,
      $Res Function(_$_CreateWarehouseState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? name = null,
    Object? address = null,
    Object? message = null,
    Object? warehouses = null,
  }) {
    return _then(_$_CreateWarehouseState(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as Status,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      address: null == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      warehouses: null == warehouses
          ? _value.warehouses
          : warehouses // ignore: cast_nullable_to_non_nullable
              as Iterable<Warehouse>,
    ));
  }
}

/// @nodoc

class _$_CreateWarehouseState implements _CreateWarehouseState {
  const _$_CreateWarehouseState(
      {this.status = Status.initial,
      this.name = '',
      this.address = '',
      this.message = '',
      this.warehouses = const []});

  @override
  @JsonKey()
  final Status status;
  @override
  @JsonKey()
  final String name;
  @override
  @JsonKey()
  final String address;
  @override
  @JsonKey()
  final String message;
  @override
  @JsonKey()
  final Iterable<Warehouse> warehouses;

  @override
  String toString() {
    return 'CreateWarehouseState(status: $status, name: $name, address: $address, message: $message, warehouses: $warehouses)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_CreateWarehouseState &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.address, address) || other.address == address) &&
            (identical(other.message, message) || other.message == message) &&
            const DeepCollectionEquality()
                .equals(other.warehouses, warehouses));
  }

  @override
  int get hashCode => Object.hash(runtimeType, status, name, address, message,
      const DeepCollectionEquality().hash(warehouses));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_CreateWarehouseStateCopyWith<_$_CreateWarehouseState> get copyWith =>
      __$$_CreateWarehouseStateCopyWithImpl<_$_CreateWarehouseState>(
          this, _$identity);
}

abstract class _CreateWarehouseState implements CreateWarehouseState {
  const factory _CreateWarehouseState(
      {final Status status,
      final String name,
      final String address,
      final String message,
      final Iterable<Warehouse> warehouses}) = _$_CreateWarehouseState;

  @override
  Status get status;
  @override
  String get name;
  @override
  String get address;
  @override
  String get message;
  @override
  Iterable<Warehouse> get warehouses;
  @override
  @JsonKey(ignore: true)
  _$$_CreateWarehouseStateCopyWith<_$_CreateWarehouseState> get copyWith =>
      throw _privateConstructorUsedError;
}
