import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:inventory_app/core/constant/status.dart';

part 'login_state.freezed.dart';

@freezed
class LoginState with _$LoginState {
  const factory LoginState({
    @Default(Status.initial) Status status,
    @Default('') String email,
    @Default('') String password,
    @Default('') String message,
  }) = _LoginState;
}
