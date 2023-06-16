import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:inventory_app/core/constant/status.dart';

part 'home_state.freezed.dart';

@freezed
class HomeState with _$HomeState {
  const factory HomeState({
    @Default(Status.initial) Status status,
    @Default(0) int index,
  }) = _HomeState;
}
