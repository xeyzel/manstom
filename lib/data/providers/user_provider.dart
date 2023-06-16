import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:inventory_app/core/exceptions/email_exception.dart';
import 'package:inventory_app/core/exceptions/login_exception.dart';
import 'package:inventory_app/core/services/bcrypt_service.dart';
import 'package:inventory_app/core/util/utils.dart';
import 'package:inventory_app/data/model/login/login.dart';
import 'package:inventory_app/data/model/register/register.dart';
import 'package:inventory_app/data/model/user/user.dart';

class UserProvider {
  static final _instance = FirebaseFirestore.instance;
  static final _collection = _instance.collection('users');

  Future<String> login(Login login) async {
    const error = 'Invalid email or password';

    try {
      final snapshot =
          await _collection.where('email', isEqualTo: login.email).get();
      final users = snapshot.docs;

      if (users.isEmpty) {
        throw LoginException(error);
      }

      final userRaw = users.first;
      final user = User.fromJson(userRaw.data()).copyWith(id: userRaw.id);

      print(user);

      if (!BcryptService.verify(login.password, user.password)) {
        throw LoginException(error);
      }

      return user.id;
    } on FirebaseException {
      rethrow;
    }
  }

  Future<bool> register(Register register) async {
    try {
      final user = register.copyWith(
        password: BcryptService.hash(register.password),
        name: Utils.capital(register.name),
      );

      final users =
          await _collection.where('email', isEqualTo: user.email).get();

      if (users.docs.isNotEmpty) {
        throw EmailException('Email already exist');
      }

      await _collection.add(user.toJson());
      return true;
    } on FirebaseException {
      rethrow;
    }
  }

  Future<User> getUser(String userId) async {
    try {
      final user = await _collection.doc(userId).get();
      return User.fromJson(user.data()!).copyWith(id: user.id);
    } on FirebaseException {
      rethrow;
    }
  }
}
