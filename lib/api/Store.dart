import 'package:shared_preferences/shared_preferences.dart';
import 'package:shared_preferences_web/shared_preferences_web.dart';

class Store {
  static Store _instance;

  static String LOGGED_IN = "loggedIn";

  static Store get instance {
    if (_instance == null) {
      _instance = new Store();
    }
    return _instance;
  }

  Future<bool> saveBool(String saveKey, bool saveValue) async {
    final prefs = await SharedPreferences.getInstance();
    final key = saveKey;
    final value = saveValue;
    return prefs.setBool(key, value);
  }

  Future<bool> save(String saveKey, String saveValue) async {
    final prefs = await SharedPreferences.getInstance();
    final key = saveKey;
    final value = saveValue;
    return prefs.setString(key, value);
  }

  Future<bool> saveList(String saveKey, List<String> list) async {
    final prefs = await SharedPreferences.getInstance();
    final key = saveKey;
    final value = list;
    return prefs.setStringList(key, value);
  }

  Future<String> get(String saveKey) async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.get(saveKey) ?? "";
  }

  Future<bool> getBool(String saveKey) async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.get(saveKey) ?? false;
  }

  Future<List<String>> getList(String saveKey) async {
    final prefs = await SharedPreferences.getInstance();
    return List<String>.from(prefs.get(saveKey)).toList() ?? [];
  }

  Future<bool> clear(String key) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.remove(key);
  }

  Future<bool> clearAll() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.clear();
  }
}
