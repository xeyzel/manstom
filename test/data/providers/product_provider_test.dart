// import 'package:flutter_test/flutter_test.dart';
// import 'package:inventory_app/data/model/product/product.dart';
// import 'package:inventory_app/data/providers/product_provider.dart';

// void main() {
//   group("Product Provider", () {
//     late ProductProvider productProvider;

//     setUpAll(() {
//       productProvider = ProductProvider();
//     });

//     test('save', () {
//       productProvider.save(Product(id: '1', title: 'mie', wareId: 'b'));
//       productProvider.save(Product(id: '2', title: 'instance', wareId: 'b'));
//       productProvider.save(Product(id: '2', title: 'roko', wareId: 'a'));
//     });

//     test('Get all', () {
//       final products = productProvider.findAll();
//       print(products);
//     });

//     test('Get by id', () {
//       final product = productProvider.findById('1');

//       if (product != null) {
//         print(product.copyWith(quantity: 100));
//       }

//       print(productProvider.findAll());
//     });

//     test('Get all by ware', () {
//       final products = productProvider.findAllByWareId('b');
//       print(products);
//     });
//   });
// }
