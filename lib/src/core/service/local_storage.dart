import 'package:hive/hive.dart';
import 'package:techara_merchant/api/models/verify_2fa_response.dart';

class LocalDatabase {
  static Future<void> iniLocalDataBase() async {
    await Hive.openBox('altejara_merchant_key_storage');
  }

  static Future<int> clearData() {
    return Hive.box('altejara_merchant_key_storage').clear();
  }

  static Future<void> saveData(String key, dynamic value) {
    return Hive.box('altejara_merchant_key_storage').put(key, value);
  }

  static T getData<T>(String key) {
    final value = Hive.box('altejara_merchant_key_storage').get(key);

    if (value is Map && T.toString().startsWith('Map<String,')) {
      // Convert keys to String for safety
      final converted = value.map((k, v) => MapEntry(k.toString(), v));

      return converted as T;
    }

    return value as T;
  }

  static Future<void> deleteData(String key) {
    return Hive.box('altejara_merchant_key_storage').delete(key);
  }

  static bool containsKey(String key) {
    return Hive.box('altejara_merchant_key_storage').containsKey(key);
  }

  static Future<void> clearKey(String key) {
    return Hive.box('altejara_merchant_key_storage').delete(key);
  }

  static Future<void> clearAll() {
    return Hive.box('altejara_merchant_key_storage').clear();
  }

  static Future<void> setAuth() {
    return saveData('auth_app_key', true);
  }

  static bool getAuth() {
    return getData<bool?>('auth_app_key') ?? false;
  }

  static Future<void> saveUserEntity(Verify2FaResponse userEntity) {
    return saveData('use_entity_key', userEntity.toJson());
  }

  static Verify2FaResponse? getUserEntity() {
    final data = getData<Map<String, dynamic>?>('use_entity_key');
    if (data == null) {
      return null;
    }
    return Verify2FaResponse.fromJson(data);
  }

  static Future<void> saveToken(String s) {
    return saveData('auth_token_key', s);
  }

  static String? getToken() {
    final data = getData<String?>('auth_token_key');
    if (data == null) {
      return null;
    }
    return data;
  }
}
