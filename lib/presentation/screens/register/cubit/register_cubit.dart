import 'dart:async';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:inventory_app/core/constant/status.dart';
import 'package:inventory_app/core/exceptions/email_exception.dart';
import 'package:inventory_app/data/model/register/register.dart';
import 'package:inventory_app/data/repositories/user_repotiory.dart';
import 'package:inventory_app/presentation/screens/register/cubit/register_state.dart';
import 'package:rxdart/rxdart.dart';

class RegisterCubit extends Cubit<RegisterState> {
  final _userRepository = UserRepository();
  final _name = BehaviorSubject<String>();
  final _email = BehaviorSubject<String>();
  final _password = BehaviorSubject<String>();

  RegisterCubit() : super(const RegisterState());

  void reset() => emit(const RegisterState());

  void setName(String value) {
    _name.sink.add(value);
    emit(state.copyWith(name: value));
  }

  void setEmail(String value) {
    _email.sink.add(value);
    emit(state.copyWith(email: value));
  }

  void setPassword(String value) {
    _password.sink.add(value);
    emit(state.copyWith(password: value));
  }

  void register() async {
    emit(state.copyWith(status: Status.loading));
    try {
      final result = await _userRepository.register(Register(
        name: state.name,
        email: state.email,
        password: state.password,
      ));

      if (!result) return;

      emit(state.copyWith(
        status: Status.success,
        message: 'Register Successful',
      ));
    } on EmailException catch (error) {
      emit(state.copyWith(
        status: Status.failure,
        message: error.message,
      ));
    } on FirebaseException catch (error) {
      emit(state.copyWith(
        status: Status.failure,
        message: error.message.toString(),
      ));
    }
  }

  Stream<String> get name =>
      _name.stream.transform(StreamTransformer.fromHandlers(
        handleData: (data, sink) {
          if (data.length < 3) {
            return sink.addError('Name must be more than 3 characters');
          }
          return sink.add(data);
        },
      ));

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

  Stream<String> get password =>
      _password.stream.transform(StreamTransformer.fromHandlers(
        handleData: (data, sink) {
          final upper = RegExp(r'[A-Z]');
          final lower = RegExp(r'[a-z]');
          final digits = RegExp(r'[0-9]');
          final special = RegExp(r'[!@#$%^&*()-+={}[]|\~<>?]');

          if (!upper.hasMatch(data)) {
            return sink.addError('There must be contain capital letters');
          }

          if (!lower.hasMatch(data)) {
            return sink.addError('There must be contain lowercase letters');
          }

          if (!digits.hasMatch(data)) {
            return sink.addError('There must be contain a number');
          }

          if (!special.hasMatch(data)) {
            return sink.addError('There must be contain a special character');
          }

          if (data.length < 6) {
            return sink.addError('Must be longer than 6 characters');
          }

          return sink.add(data);
        },
      ));

  Stream<bool> get valid =>
      CombineLatestStream.combine3(name, email, password, (a, b, c) => true);
}
