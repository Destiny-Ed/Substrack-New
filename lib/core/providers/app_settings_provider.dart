import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppSettingsProvider extends ChangeNotifier {
  static const _themeModeKey = 'theme_mode';
  static const _currencyKey = 'preferred_currency';
  static const _notificationsKey = 'notifications_enabled';

  ThemeMode _themeMode = ThemeMode.system;
  String _currency = 'USD';
  bool _notificationsEnabled = true;

  ThemeMode get themeMode => _themeMode;
  String get currency => _currency;
  bool get notificationsEnabled => _notificationsEnabled;

  bool get isDarkMode {
    if (_themeMode == ThemeMode.system) {
      // Fallback – actual system brightness is handled by MaterialApp
      return false;
    }
    return _themeMode == ThemeMode.dark;
  }

  Future<void> load() async {
    final prefs = await SharedPreferences.getInstance();

    final themeIndex = prefs.getInt(_themeModeKey);
    if (themeIndex != null && themeIndex >= 0 && themeIndex < ThemeMode.values.length) {
      _themeMode = ThemeMode.values[themeIndex];
    }

    _currency = prefs.getString(_currencyKey) ?? 'USD';
    _notificationsEnabled = prefs.getBool(_notificationsKey) ?? true;

    notifyListeners();
  }

  Future<void> setThemeMode(ThemeMode mode) async {
    if (_themeMode == mode) return;
    _themeMode = mode;
    notifyListeners();

    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt(_themeModeKey, mode.index);
  }

  Future<void> toggleDarkMode(bool enabled) async {
    await setThemeMode(enabled ? ThemeMode.dark : ThemeMode.light);
  }

  Future<void> setCurrency(String currency) async {
    if (_currency == currency) return;
    _currency = currency;
    notifyListeners();

    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_currencyKey, currency);
  }

  Future<void> setNotificationsEnabled(bool enabled) async {
    if (_notificationsEnabled == enabled) return;
    _notificationsEnabled = enabled;
    notifyListeners();

    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(_notificationsKey, enabled);
  }
}
