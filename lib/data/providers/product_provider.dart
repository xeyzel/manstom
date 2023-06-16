import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:inventory_app/data/model/product/product.dart';

class ProductProvider {
  static final _instance = FirebaseFirestore.instance;
  static final _collection = _instance.collection("products");

  Future<bool> insertOne(Product product) async {
    try {
      final data = product.toJson();
      data.remove('id');
      await _collection.add(data);
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

  Future<bool> updateOne(Product product) async {
    final id = product.id;
    final data = product.toJson();
    data.remove('id');

    try {
      await _collection.doc(id).update(product.toJson());
      return true;
    } on FirebaseException {
      rethrow;
    }
  }

  void findOne(String id) {}

  Future<Iterable<Product>> findAll(String userId,
      [String? warehouseId]) async {
    try {
      var snapshot = _collection.where('userId', isEqualTo: userId);

      if (warehouseId != null) {
        snapshot = snapshot.where('warehouseId', isEqualTo: warehouseId);
      }

      final snapshotFinal = await snapshot.get();

      final products = snapshotFinal.docs
          .map((e) => Product.fromJson(e.data()).copyWith(id: e.id));
      return products;
    } on FirebaseException {
      rethrow;
    }
  }

  void findByUserIdAndWarehouseId() {}

  void findByUserId(String userId) {}

  void deleteAll() {}
}
