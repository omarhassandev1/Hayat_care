abstract class SettingsRepository {

  Future<void> cacheTheme(bool isDark);
  bool getThemeMode();

  Future<void> cacheLanguage(String langCode);
  String getLanguage();
}