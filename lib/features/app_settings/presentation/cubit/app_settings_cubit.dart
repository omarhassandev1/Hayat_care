import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../domain/usecases/theme_usecase.dart';
import 'app_settings_state.dart';

@injectable
class AppSettingCubit extends Cubit<AppSettingState> {
  final GetThemeUseCase getThemeUseCase;
  final CacheThemeUseCase cacheThemeUseCase;
  final GetLanguageUseCase getLanguageUseCase;
  final SetLanguageUseCase setLanguageUseCase;

  AppSettingCubit(
    this.getLanguageUseCase,
    this.setLanguageUseCase,
    this.getThemeUseCase,
    this.cacheThemeUseCase,
  ) : super(
        AppSettingState(
          themeMode: getThemeUseCase() ? ThemeMode.dark : ThemeMode.light,
          locale: Locale(getLanguageUseCase()),
        ),
      );

  void toggleTheme() async {
    final isDark = state.themeMode == ThemeMode.light;
    final newMode = isDark ? ThemeMode.dark : ThemeMode.light;

    await cacheThemeUseCase(isDark);
    emit(state.copyWith(themeMode: newMode));
  }

  void changeLanguage(String langCode) async {
    if (state.locale.languageCode == langCode) return;
    await setLanguageUseCase(langCode);
    emit(state.copyWith(locale: Locale(langCode)));
  }

}
