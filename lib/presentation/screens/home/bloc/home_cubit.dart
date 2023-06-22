
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:inventory_app/core/constant/status.dart';
import 'package:inventory_app/core/util/utils.dart';
import 'package:inventory_app/data/model/transaction/transaction.dart';
import 'package:inventory_app/data/repositories/user_repotiory.dart';

import 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  final _repository = UserRepository();

  HomeCubit() : super(const HomeState());

  void setIndex(int index) => emit(state.copyWith(index: index));

  void getProduct() async {
    emit(state.copyWith(status: Status.loading));
    try {
      final products = await _repository.findAllProduct();
      final productFiltered =
          products.where((element) => element.quantity <= 10);
      var newProduct = products.toList();
      newProduct = Utils.sortByDate(newProduct).toList().sublist(0,5);
      await getTransaction();
      emit(state.copyWith(
        status: Status.success,
        newProducts: Utils.sortByDate(newProduct),
        products: Utils.sortByQuantity(productFiltered),
        allProduct: products,
      ));
    } on FirebaseException {
      emit(state.copyWith(status: Status.failure));
    }
  }

  Future<void> getTransaction() async {
    Iterable<Transaction> rawTransaction = [];

    try {
      final transactions = await _repository.findAllTransactions();
      if (transactions.isNotEmpty && transactions.length >= 3) {
        rawTransaction = Utils.sortTransactionByDate(transactions)
            .toList()
            .sublist(0, 3);
        
      }else{
        rawTransaction = Utils.sortTransactionByDate(transactions);
      }

      emit(
        state.copyWith(transactions: rawTransaction),
      );
    } on FirebaseException {
      rethrow;
    }
  }
}
