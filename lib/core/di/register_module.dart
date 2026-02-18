import 'package:hive_flutter/hive_flutter.dart';
import 'package:injectable/injectable.dart';

@module
abstract class RegisterModule {
  @preResolve
  Future<Box> get settingsBox => Hive.openBox('settings_box');
}