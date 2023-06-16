import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:inventory_app/core/constant/status.dart';
import 'package:inventory_app/data/repositories/user_repotiory.dart';

import 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  final _repository = UserRepository();
  ProfileCubit() : super(const ProfileState());

  void reset() => emit(const ProfileState());

  void started() async {
    emit(state.copyWith(status: Status.loading));
    try {
      final user = await _repository.getUser();
      emit(state.copyWith(
        status: Status.success,
        user: user,
      ));
    } on FirebaseException {
      emit(state.copyWith(status: Status.failure));
    }
  }

  void logout() async {
    emit(state.copyWith(status: Status.loading));
    try {
      final result = await _repository.removeUserId();
      if (!result) return;
      emit(state.copyWith(status: Status.success, loggedOut: result));
      reset();
    } on FirebaseException {
      emit(state.copyWith(status: Status.failure));
    }
  }
}
