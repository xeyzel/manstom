import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:inventory_app/core/constant/status.dart';
import 'package:inventory_app/data/model/warehouse/warehouse.dart';

part 'create_warehouse_state.freezed.dart';

@freezed
class CreateWarehouseState with _$CreateWarehouseState {
  const factory CreateWarehouseState({
    @Default(Status.initial) Status status,
    @Default('') String name,
    @Default('') String address,
    @Default('') String message,
    @Default([]) Iterable<Warehouse> warehouses,
  }) = _CreateWarehouseState;
}
