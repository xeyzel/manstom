import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:inventory_app/core/constant/status.dart';

part 'splash_state.freezed.dart';

@freezed
class SplashState with _$SplashState {
  const factory SplashState({
    @Default(Status.initial) Status status,
    String? userId,
  }) = _SplashState;
}
