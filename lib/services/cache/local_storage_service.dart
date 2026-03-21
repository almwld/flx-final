import 'package:hive_flutter/hive_flutter.dart';

class LocalStorageService {
  static late Box _box;
  
  static Future<void> init() async {
    await Hive.initFlutter();
    _box = await Hive.openBox('flex_yemen');
  }

  static void setString(String key, String value) => _box.put(key, value);
  static String? getString(String key) => _box.get(key);
}
