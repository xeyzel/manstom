import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:inventory_app/core/constant/status.dart';

part 'register_state.freezed.dart';

@freezed
class RegisterState with _$RegisterState {
  const factory RegisterState({
    @Default(Status.initial) Status status,
    @Default('') String name,
    @Default('') String email,
    @Default('') String password,
    @Default('') String message,
  }) = _RegisterState;
}
