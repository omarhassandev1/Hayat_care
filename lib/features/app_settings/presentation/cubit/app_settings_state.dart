import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class AppSettingState extends Equatable {
  final ThemeMode themeMode;
  final Locale locale;

  const AppSettingState({
    required this.themeMode,
    required this.locale,
  });

  AppSettingState copyWith({
    ThemeMode? themeMode,
    Locale? locale,
  }) {
    return AppSettingState(
      themeMode: themeMode ?? this.themeMode,
      locale: locale ?? this.locale,
    );
  }

  @override
  List<Object> get props => [themeMode, locale];
}