


import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:inventory_app/core/constant/status.dart';
import 'package:inventory_app/data/repositories/user_repotiory.dart';
import 'package:inventory_app/presentation/screens/transaction/cubit/transaction_state.dart';

class TransactionCubit extends Cubit<TransactionState> {
  final _repository = UserRepository();

  TransactionCubit(): super(TransactionState());



  void findAllTransaction() async {
    emit(state.copyWith(status: Status.loading));
    try{
      final transactions =await _repository.findAllTransactions();
      emit(state.copyWith(status: Status.success, transactions: transactions,));
    }catch (error){
      emit(state.copyWith(status: Status.failure));
    }



  }


}