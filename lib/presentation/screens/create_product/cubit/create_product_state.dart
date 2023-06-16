import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:image_picker/image_picker.dart';
import 'package:inventory_app/core/constant/status.dart';
import 'package:inventory_app/data/model/product/product.dart';

part 'create_product_state.freezed.dart';

@freezed
class CreateProductState with _$CreateProductState {
  const factory CreateProductState({
    XFile? imageFile,
    @Default(Status.initial) Status status,
    @Default('') String name,
    @Default('') String description,
    @Default('') String message,
    @Default('') String WarehouseId,
    @Default(0) int price,
    @Default(0) int quantity,
    @Default([]) Iterable<Product> products,
    String? selectedWarehouseId,
  }) = _CreateProductState;
}
