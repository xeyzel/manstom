import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:inventory_app/core/constant/status.dart';
import 'package:inventory_app/data/model/product/product.dart';
import 'package:inventory_app/data/model/transaction/transaction.dart';

part 'home_state.freezed.dart';

@freezed
class HomeState with _$HomeState {
  const factory HomeState({
    @Default(Status.initial) Status status,
    @Default(0) int index,
    @Default([]) Iterable<Product> products,
    @Default([]) Iterable<Product> allProduct,
    @Default([]) Iterable<Product> newProducts,
    @Default([]) Iterable<Transaction> transactions,

  }) = _HomeState;
}
