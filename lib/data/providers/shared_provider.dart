import 'package:shared_preferences/shared_preferences.dart';

class SharedProvider {
  static const _userId = 'usersId';

  final _sharedPreference = SharedPreferences.getInstance();

  Future<bool> saveUserId(String userId) async {
    final shared = await _sharedPreference;
    return await shared.setString(_userId, userId);
  }

  Future<bool> removeUserId() async {
    final shared = await _sharedPreference;
    return await shared.remove(_userId);
  }

  Future<String?> getUserId() async {
    final shared = await _sharedPreference;
    return shared.getString(_userId);
  }
}
