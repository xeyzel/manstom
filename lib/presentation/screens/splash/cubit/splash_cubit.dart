import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:inventory_app/core/constant/status.dart';
import 'package:inventory_app/data/repositories/user_repotiory.dart';
import 'package:inventory_app/presentation/screens/splash/cubit/splash_state.dart';

class SplashCubit extends Cubit<SplashState> {
  final _repository = UserRepository();

  SplashCubit() : super(const SplashState());

  void reset() => emit(const SplashState());

  void started() async {
    emit(state.copyWith(status: Status.loading));
    try {
      final result = await _repository.getUserId();

      emit(state.copyWith(
        status: Status.success,
        userId: result,
      ));
    } catch (_) {
      emit(state.copyWith(status: Status.failure));
    }
  }
}
