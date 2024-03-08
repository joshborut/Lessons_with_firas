import 'package:food_boxes/app_constants.dart';
import 'package:hive/hive.dart';

class PreferenceBox {
  static const _confirmCancellationToggle = "confirmCancellationToggleKey";

  static late final Box<dynamic> _box;

  PreferenceBox() {
    _box = Hive.box<dynamic>(AppConstants.boxName);
  }

  static T _getValue<T>(dynamic key) => _box.get(key) as T;

  static Future<void> _setValue<T>(dynamic key, T value) =>
      _box.put(key, value);

  // Setters

  static Future<void> setConfirmCancellationToggle(bool value) {
    return _setValue(_confirmCancellationToggle, value);
  }

  // Getters

  static bool getConfirmCancellationToggle() {
    if (_getValue(_confirmCancellationToggle) == null) {
      return false;
    }
    return _getValue<bool>(_confirmCancellationToggle);
  }
}
