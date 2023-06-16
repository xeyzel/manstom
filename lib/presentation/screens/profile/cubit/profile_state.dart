import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:inventory_app/core/constant/status.dart';
import 'package:inventory_app/data/model/user/user.dart';

part 'profile_state.freezed.dart';

@freezed
class ProfileState with _$ProfileState {
  const factory ProfileState({
    @Default(Status.initial) Status status,
    @Default(User()) User user,
    @Default(false) bool loggedOut,
  }) = _ProfileState;
}
