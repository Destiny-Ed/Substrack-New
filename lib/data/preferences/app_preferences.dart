import 'package:shared_preferences/shared_preferences.dart';

class AppPreferences {
  static const _onboardingKey = 'onboarding_completed';
  static const _premiumKey = 'premium_user';
  static const _launchCountKey = 'launch_count';
  static const _currencyKey = 'preferred_currency';

  final SharedPreferences preferences;

  const AppPreferences(this.preferences);

  bool get hasCompletedOnboarding => preferences.getBool(_onboardingKey) ?? false;

  Future<void> completeOnboarding() async {
    await preferences.setBool(_onboardingKey, true);
  }

  bool get isPremium => preferences.getBool(_premiumKey) ?? false;

  Future<void> setPremium(bool value) async {
    await preferences.setBool(_premiumKey, value);
  }

  int get launchCount => preferences.getInt(_launchCountKey) ?? 0;

  Future<void> incrementLaunchCount() async {
    await preferences.setInt(_launchCountKey, launchCount + 1);
  }

  String get preferredCurrency => preferences.getString(_currencyKey) ?? 'USD';

  Future<void> setPreferredCurrency(String currency) async {
    await preferences.setString(_currencyKey, currency);
  }
}
