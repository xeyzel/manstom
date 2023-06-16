import 'dart:async';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:inventory_app/core/constant/status.dart';
import 'package:inventory_app/core/exceptions/login_exception.dart';
import 'package:inventory_app/data/model/login/login.dart';
import 'package:inventory_app/data/repositories/user_repotiory.dart';
import 'package:rxdart/rxdart.dart';

import 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  final _repository = UserRepository();

  final _email = BehaviorSubject<String>();

  LoginCubit() : super(const LoginState());

  void reset() => emit(const LoginState());

  void setEmail(String value) {
    _email.sink.add(value);
    emit(state.copyWith(email: value));
  }

  void setPassword(String value) => emit(state.copyWith(password: value));

  void login() async {
    emit(state.copyWith(status: Status.loading));
    try {
      final result = await _repository.login(Login(
        email: state.email,
        password: state.password,
      ));

      final saveResult = await _repository.saveUserId(result);

      if (!saveResult) return;

      emit(state.copyWith(
        status: Status.success,
        message: 'Login Successful',
      ));
    } on LoginException catch (e) {
      emit(state.copyWith(
        status: Status.failure,
        message: e.message,
      ));
    } on FirebaseException catch (e) {
      emit(state.copyWith(
        status: Status.failure,
        message: e.message.toString(),
      ));
    }
  }

  Stream<String> get email =>
      _email.stream.transform(StreamTransformer.fromHandlers(
        handleData: (data, sink) {
          RegExp regexEmail =
              RegExp(r'^[\w-]+(\.[\w-]+)*@([\w-]+\.)+[a-zA-Z]{2,}$');

          if (!regexEmail.hasMatch(data)) {
            return sink.addError('Please input a valid email');
          }
          return sink.add(data);
        },
      ));

  Stream<bool> get valid => CombineLatestStream([email], (values) => true);
}
