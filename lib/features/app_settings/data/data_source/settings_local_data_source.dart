import 'package:hive_flutter/hive_flutter.dart';
import 'package:injectable/injectable.dart';

abstract class SettingsLocalDataSource {
  bool isDarkMode();
  Future<void> cacheTheme(bool isDark);

  String getLanguage();
  Future<void> cacheLanguage(String langCode);
}


@LazySingleton(as: SettingsLocalDataSource)
class SettingsLocalDataSourceImpl implements SettingsLocalDataSource {
  final Box _box;
  static const String themeKey = 'is_dark_mode';
  static const String langKey = 'app_language';

  SettingsLocalDataSourceImpl(this._box);

  @override
  bool isDarkMode() => _box.get(themeKey, defaultValue: false);

  @override
  Future<void> cacheTheme(bool isDark) async => await _box.put(themeKey, isDark);


  @override
  String getLanguage() => _box.get(langKey, defaultValue: 'en');

  @override
  Future<void> cacheLanguage(String langCode) async => await _box.put(langKey, langCode);

}