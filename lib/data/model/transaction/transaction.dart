import 'package:freezed_annotation/freezed_annotation.dart';

part 'transaction.freezed.dart';
part 'transaction.g.dart';

@freezed
class Transaction with _$Transaction {
  const factory Transaction({
    @Default("") String id,
    @Default("") String productName,
    @Default("") String warehouseName,
    @Default("") String? infoPrice,
    @Default("") String? infoQuantity,
    @Default("") String createdAt,
    @Default("") String idTransaction,
    @Default("") String userId,
  }) = _Transaction;

  factory Transaction.fromJson(Map<String, dynamic> json) =>
      _$TransactionFromJson(json);
}
