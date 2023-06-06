import 'package:food_boxes/app_constants.dart';
import 'package:hive/hive.dart';

class UserInfoBox {
  static const _userIdKey = "userIdKey";

  static late final Box<dynamic> _box;

  UserInfoBox() {
    _box = Hive.box<dynamic>(AppConstants.boxName);
  }

  static T _getValue<T>(dynamic key) => _box.get(key) as T;

  static Future<void> _setValue<T>(dynamic key, T value) =>
      _box.put(key, value);

  static String getUserId() {
    if (_getValue(_userIdKey) == null) {
      return "";
    }
    return _getValue(_userIdKey);
  }

  static Future<void> setUserId(String value) {
    return _setValue(_userIdKey, value);
  }
}
