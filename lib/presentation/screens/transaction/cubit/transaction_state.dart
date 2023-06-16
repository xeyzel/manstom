import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:inventory_app/core/constant/status.dart';
import 'package:inventory_app/data/model/transaction/transaction.dart';

part 'transaction_state.freezed.dart';

@freezed
class TransactionState with _$TransactionState {
  const factory TransactionState({
    @Default(Status.initial) Status status,
    @Default([]) Iterable<Transaction> transactions,
  })= _TransactionState;
}