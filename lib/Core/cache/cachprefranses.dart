import 'package:shared_preferences/shared_preferences.dart';

class PreferencesService {
  static late SharedPreferences _preferences;

  static Future<void> init() async {
    _preferences = await SharedPreferences.getInstance();
  }

  static Future<void> setUserName(key, value) async {
    if (value is String) {
      await _preferences.setString(key, value);
    } else if (value is bool) {
      await _preferences.setBool(key, value);
    } else if (value is int) {
      await _preferences.setInt(key, value);
    } else if (value is double) {
      await _preferences.setDouble(key, value);
    }
  }

  static String? getUserName(key) {
    return _preferences.getString(key);
  }

  static bool? getbool(key) {
    return _preferences.getBool(key);
  }

  static int? getInt(key) {
    return _preferences.getInt(key);
  }

  static double? getIDouble(key) {
    return _preferences.getDouble(key);
  }
}
