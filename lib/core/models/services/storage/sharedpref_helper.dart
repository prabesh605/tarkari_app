import 'package:shared_preferences/shared_preferences.dart';
import 'package:tarkari_app/persistance_exceptions.dart';

class SharedPrefHelper {
  SharedPrefHelper._();
  static SharedPreferences? sharedPreferences;
  SharedPreferences get instance =>
      sharedPreferences ?? (throw Exception("Not Initialized"));

  static Future<void> init() async {
    sharedPreferences = await SharedPreferences.getInstance();

    // Get.lazyPut(() => SqfliteDB());
  }

  static String read(String key) {
    try {
      return sharedPreferences?.getString(key) ?? "";
    } catch (e) {
      throw PersistanceException('There is a problem in reading $key: $e');
    }
  }

  static bool readBool(String key) {
    try {
      return sharedPreferences?.getBool(key) ?? false;
    } catch (e) {
      throw PersistanceException('There is a problem in reading $key: $e');
    }
  }

  static Future<bool> writeString<T>(String key, T value) async {
    try {
      return await sharedPreferences!.setString(key, value as String);
    } catch (e) {
      throw PersistanceException('There is a problem in writing $key: $e');
    }
  }

  static Future<bool> writeBool(String key, bool value) async {
    try {
      return await sharedPreferences!.setBool(key, value);
    } catch (e) {
      throw PersistanceException('There is a problem in writing $key: $e');
    }
  }

  static Future<bool> delete(String key) async {
    return sharedPreferences!.remove(key);
  }

  static Future<bool> deleteAll() async {
    return await sharedPreferences!.clear();
  }
}
