import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:inventory_app/core/constant/status.dart';
import 'package:inventory_app/data/model/warehouse/warehouse.dart';
import 'package:inventory_app/data/repositories/user_repotiory.dart';
import 'package:inventory_app/presentation/screens/create_warehouse/cubit/create_warehouse_state.dart';

class CreateWarehouseCubit extends Cubit<CreateWarehouseState> {
  final _repository = UserRepository();

  CreateWarehouseCubit() : super(const CreateWarehouseState());

  void setName(String value) => emit(state.copyWith(name: value));

  void setAddress(String value) => emit(state.copyWith(address: value));

  Future<bool> insertWarehouse() async {
    emit(state.copyWith(status: Status.loading));
    try {
      final warehouse = Warehouse(
        name: state.name.trim(),
        address: state.address.trim(),
      );

      final result = await _repository.insertWarehouse(warehouse);

      emit(
          state.copyWith(status: Status.success, message: 'Warehouse Created'));
      return true;
    } on FirebaseException catch (error) {
      emit(state.copyWith(
        status: Status.failure,
        message: '${error.message}',
      ));
      return false;
    }
  }

  void updateWarehoue(Warehouse warehouse) async {
    emit(state.copyWith(status: Status.loading));
    try {
      final result = await _repository.updateOneWarehouse(warehouse);

      if (result) {
        emit(state.copyWith(status: Status.success));
      }
    } on FirebaseException catch (error) {
      emit(state.copyWith(
        status: Status.failure,
        message: '${error.message}',
      ));
    }
  }

  void deleteOneWarehouse(String id) async {
    try {
      final result = await _repository.deleteOneWarehouse(id);
      final warehouses = await _repository.findAllWarehouse();
      if (result) {
        emit(state.copyWith(status: Status.success, warehouses: warehouses));
      }
    } on FirebaseException catch (error) {
      emit(state.copyWith(
        status: Status.failure,
        message: '${error.message}',
      ));
    }
  }

  void findAllWarehouse() async {
    emit(state.copyWith(status: Status.loading));
    try {
      final warehouses = await _repository.findAllWarehouse();

      emit(state.copyWith(
        status: Status.success,
        warehouses: warehouses,
      ));
    } on FirebaseException catch (error) {
      emit(state.copyWith(
        status: Status.failure,
        message: '${error.message}',
      ));
    }
  }
}
