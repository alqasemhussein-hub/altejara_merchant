import 'dart:ui';

import 'package:hive/hive.dart';
import 'package:provider/provider.dart';
import 'package:techara_merchant/src/core/const/variable.dart';
import 'package:techara_merchant/src/core/style/theme/theme_provider.dart';
import 'package:techara_merchant/src/main/auth/domain/user_entity.dart';
import 'package:techara_merchant/src/main/mini_apps/news/domain/entities/news_text_style.dart';

class LocalDatabase {
  static Future<void> iniLocalDataBase() async {
    await Hive.openBox('super_app_halla_local_data');
  }

  static Future<int> clearData() {
    return Hive.box('super_app_halla_local_data').clear();
  }

  static Future<void> saveData(String key, dynamic value) {
    return Hive.box('super_app_halla_local_data').put(key, value);
  }

  static T getData<T>(String key) {
    return Hive.box('super_app_halla_local_data').get(key) as T;
  }

  static Future<void> deleteData(String key) {
    return Hive.box('super_app_halla_local_data').delete(key);
  }

  static bool containsKey(String key) {
    return Hive.box('super_app_halla_local_data').containsKey(key);
  }

  static Future<void> clearKey(String key) {
    return Hive.box('super_app_halla_local_data').delete(key);
  }

  static Future<void> clearAll() {
    return Hive.box('super_app_halla_local_data').clear();
  }

  static Future<void> saveNewsTextStyle(NewsTextStyle style) {
    return saveData('news_text_style', style.tojson());
  }

  static NewsTextStyle getNewsTextStyle() {
    final json = getData<Map<dynamic, dynamic>?>('news_text_style');
    if (json == null) {
      return NewsTextStyle(
        scale: 1.0,
        isBold: false,
        isDarkMode:
            navigatorKey.currentContext!.read<AppThemeProvider>().brightness ==
            Brightness.dark,
      );
    }
    return NewsTextStyle.fromJson(json);
  }

  static Future<void> setAuth() {
    return saveData('auth_app_key', true);
  }

  static bool getAuth() {
    return getData<bool?>('auth_app_key') ?? false;
  }

  static Future<void> saveUserEntity(UserEntity userEntity) {
    return saveData('use_entity_key', userEntity.toJson());
  }

  static UserEntity? getUserEntity() {
    final data = getData<Map<dynamic, dynamic>?>('use_entity_key');
    if (data == null) {
      return null;
    }
    return UserEntity.fromJson(data);
  }
}
