import 'package:injectable/injectable.dart';

import '../repository/settings_repository.dart';

@lazySingleton
class GetThemeUseCase {
  final SettingsRepository repository;
  GetThemeUseCase(this.repository);

  bool call() => repository.getThemeMode();
}

@lazySingleton
class CacheThemeUseCase {
  final SettingsRepository repository;
  CacheThemeUseCase(this.repository);

  Future<void> call(bool isDark) => repository.cacheTheme(isDark);
}

@lazySingleton
class GetLanguageUseCase {
  final SettingsRepository repository;
  GetLanguageUseCase(this.repository);

  String call() => repository.getLanguage();
}

@lazySingleton
class SetLanguageUseCase {
  final SettingsRepository repository;
  SetLanguageUseCase(this.repository);

  Future<void> call(String langCode) => repository.cacheLanguage(langCode);
}