import 'package:cloud_firestore/cloud_firestore.dart' as firestore;
import 'package:inventory_app/data/model/transaction/transaction.dart';

class TransactionProvider {
  static final _instance = firestore.FirebaseFirestore.instance;
  static final _collection = _instance.collection('transactions');

  Future<bool> insertOne(Transaction transaction) async {
    final data = transaction.toJson();
    data.remove('id');
    try {
      await _collection.add(data);
      return true;
    } on firestore.FirebaseException {
      rethrow;
    }
  }

  Future<Iterable<Transaction>> findAll(String userId) async {
    try {
      final snapshot =
          await _collection.where('userId', isEqualTo: userId).get();
      return snapshot.docs
          .map((e) => Transaction.fromJson(e.data()).copyWith(id: e.id));
    } on firestore.FirebaseException {
      rethrow;
    }
  }
}
