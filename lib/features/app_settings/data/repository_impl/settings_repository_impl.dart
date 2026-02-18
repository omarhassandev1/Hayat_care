import 'package:injectable/injectable.dart';

import '../../domain/repository/settings_repository.dart';
import '../data_source/settings_local_data_source.dart';

@LazySingleton(as: SettingsRepository)
class SettingsRepositoryImpl implements SettingsRepository {
  final SettingsLocalDataSource localDataSource;

  SettingsRepositoryImpl(this.localDataSource);

  @override
  Future<void> cacheTheme(bool isDark) => localDataSource.cacheTheme(isDark);

  @override
  bool getThemeMode() => localDataSource.isDarkMode();

  @override
  Future<void> cacheLanguage(String langCode) => localDataSource.cacheLanguage(langCode);

  @override
  String getLanguage() => localDataSource.getLanguage();
}