import 'package:flutter_test/flutter_test.dart';
import 'package:inventory_app/data/model/product/product.dart';
import 'package:fake_cloud_firestore/fake_cloud_firestore.dart';

void main() {
  final instance = FakeFirebaseFirestore();
  final collection = instance.collection("products");

  test('Product Model', () async {
    var product = const Product(
      description: "enak",
      createdAt: "kemaren",
      image: "mie",
      name: "indomwie",
      price: 10000,
      quantity: 100,
      warehouseId: "asd",
      userId: "asd",
    );
    var product2 = const Product(
      description: "enak",
      createdAt: "kemaren",
      image: "mies",
      name: "indomier",
      price: 12000,
      quantity: 10,
      warehouseId: "asda",
      userId: "asda",
    );
    var product3 = const Product(
      description: "enak",
      createdAt: "kemaren",
      image: "moiea",
      name: "indomie",
      price: 10900,
      quantity: 1030,
      warehouseId: "asd",
      userId: "asd",
    );

    final productMap = product.toJson();
    final productMap2 = product2.toJson();
    final productMap3 = product3.toJson();
    productMap.remove("id");
    productMap2.remove("id");
    productMap3.remove("id");

    await collection.add(productMap);
    await collection.add(productMap2);
    await collection.add(productMap3);

    final snapshot = await collection.where("userId", isEqualTo: "asd").get();
    final products = snapshot.docs.map((e) {
      final product = Product.fromJson(e.data());
      return product.copyWith(id: e.id);
    });
    print("before");
    print(products);

    //delete
    final deleteBro = await collection.get();

    deleteBro.docChanges.forEach((e) {
      final hapus = e.doc.data()!;
      if (hapus["name"].toString() == 'indomie' &&
          hapus['userId'].toString() == 'asd') {
        // e.doc.reference.delete();
      }
    });

    final snapshote = await collection.where("userId", isEqualTo: "asd").get();
    final productse = snapshote.docs.map((e) {
      final product = Product.fromJson(e.data());
      return product.copyWith(id: e.id);
    });
    print("after");
    print(productse);
  });
}
