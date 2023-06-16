import 'package:freezed_annotation/freezed_annotation.dart';

part 'product.freezed.dart';
part 'product.g.dart';

@freezed
class Product with _$Product {
  const factory Product({
    @Default('') String id,
    @Default('') String name,
    @Default('') String image,
    @Default('') String description,
    @Default(0) int price,
    @Default(0) int quantity,
    @Default('') String createdAt,
    @Default('') String warehouseId,
    @Default('') String userId,
    @Default('') String warehouseName,
  }) = _Product;

  factory Product.fromJson(Map<String, dynamic> json) =>
      _$ProductFromJson(json);
}
