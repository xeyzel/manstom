import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../core/constant/status.dart';
import '../../../../data/model/product/product.dart';

part 'product_main_feature_state.freezed.dart';

@freezed
class ProductMainFeatureState with _$ProductMainFeatureState {
  const factory ProductMainFeatureState({
    @Default(Status.initial) Status status,
    @Default(Product()) Product product,
    @Default(0) int price,
    @Default(0) int quantity,
  }) = _ProductMainFeatureState;
}
