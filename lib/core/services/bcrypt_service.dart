import 'package:bcrypt/bcrypt.dart' as bcrypt;

class BcryptService {
  static String hash(String password) =>
      bcrypt.BCrypt.hashpw(password, bcrypt.BCrypt.gensalt());

  static bool verify(String password, String hashed) =>
      bcrypt.BCrypt.checkpw(password, hashed);
}
