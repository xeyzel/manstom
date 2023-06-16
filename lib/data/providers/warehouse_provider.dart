import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:inventory_app/data/model/warehouse/warehouse.dart';

class WarehouseProvider {
  static final _instance = FirebaseFirestore.instance;
  static final _collection = _instance.collection('warehouses');

  Future<Warehouse> findOne(String warehouseId) async {
    final snapshot = await _collection.doc(warehouseId).get();
    return Warehouse.fromJson(snapshot.data()!).copyWith(id: snapshot.id);
  }

  Future<bool> insertOne(Warehouse warehouse) async {
    final data = warehouse.toJson();
    data.remove('id');
    try {
      await _collection.add(data);
      return true;
    } on FirebaseException {
      rethrow;
    }
  }

  Future<Iterable<Warehouse>> findAll(String userId) async {
    try {
      final snapshot = await _collection.get();

      return snapshot.docs
          .map((e) => Warehouse.fromJson(e.data()).copyWith(id: e.id))
          .where((element) => element.userId == userId);
    } on FirebaseException {
      rethrow;
    }
  }

  Future<bool> updateOne(Warehouse warehouse) async {
    final data = warehouse.toJson();
    data.remove('id');
    try {
      await _collection.doc(warehouse.id).update(data);
      return true;
    } on FirebaseException {
      rethrow;
    }
  }

  Future<bool> deleteOne(String id) async {
    try {
      await _collection.doc(id).delete();
      return true;
    } on FirebaseException {
      rethrow;
    }
  }
}
