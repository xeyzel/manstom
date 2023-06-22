import 'dart:math';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:inventory_app/core/constant/status.dart';
import 'package:inventory_app/core/util/utils.dart';
import 'package:inventory_app/data/model/product/product.dart';
import 'package:inventory_app/data/model/transaction/transaction.dart';
import 'package:inventory_app/data/repositories/user_repotiory.dart';
import 'package:inventory_app/presentation/screens/product_main_feature/cubit/product_main_feature_state.dart';

class ProductMainFeatureCubit extends Cubit<ProductMainFeatureState> {
  final _repository = UserRepository();

  ProductMainFeatureCubit() : super(const ProductMainFeatureState());

  void setProduct(Product product) {
    emit(state.copyWith(product: product));
  }

  void setIsAdded(bool value) => emit(state.copyWith(isAdded: value));

  void setPrice(int value) => emit(state.copyWith(price: value));

  void setQuantity(int value) => emit(state.copyWith(quantity: value));

  void updateProduct(Product product) async {
    var transaction = const Transaction(
      infoQuantity: null,
      infoPrice: null,
    );

    transaction = transaction.copyWith(
      idTransaction: _generator(),
      productName: product.name,
      warehouseName: product.warehouseName,
      createdAt: DateTime.now().toIso8601String(),
      isIncrease: state.isAdded,
    );

    if (state.product.price != state.price) {
      transaction = transaction.copyWith(
        infoPrice:
            'Price Info: From ${Utils.formatNumberToIdr(state.product.price)} To ${Utils.formatNumberToIdr(product.price)}',
      );
    }

    final quantityNow =   state.isAdded
        ? state.product.quantity - product.quantity
        : state.product.quantity + product.quantity;

    if (state.product.quantity != state.quantity) {
      transaction = transaction.copyWith(
        infoQuantity:
            'Quantity Info: From ${state.product.quantity} To ${quantityNow}',
      );
    }

    final updatedProduct = product.copyWith(
        quantity: quantityNow );

    emit(state.copyWith(status: Status.loading));
    try {
      await _repository.updateOneProduct(updatedProduct);
      await _repository.insertOneTransaction(transaction);
      emit(state.copyWith(status: Status.success));
    } catch (error) {
      emit(state.copyWith(status: Status.failure));
    }
  }

  int _gen() => Random().nextInt(9);

  String _generator() =>
      '${_gen()}${_gen()}${_gen()}${_gen()}${_gen()}${_gen()}${_gen()}${_gen()}${_gen()}';
}
