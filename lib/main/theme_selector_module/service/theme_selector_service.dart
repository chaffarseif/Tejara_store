import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:karma_design_system_mobile/karma_design_system_mobile.dart';
import 'package:tejara_store/core/config/global_config.dart';

class ThemeSelectorService {
  late LocalStorageProvider _localStorageProvider;

  ThemeSelectorService._singleton();

  static final _singletonInstance = ThemeSelectorService._singleton();

  factory ThemeSelectorService({
    required LocalStorageProvider localStorageProvider,
  }) {
    _singletonInstance._localStorageProvider = localStorageProvider;
    return _singletonInstance;
  }

  static const String themeModeKey = 'selectedThemeMode';

  Future<StyleConfigModeType> getSelectedMode() async {
    try {
      final savedMode = await _localStorageProvider.getValue(themeModeKey);
      if (savedMode == null || savedMode is! String || savedMode.isEmpty) {
        return StyleConfigModeType.initial;
      }

      return StyleConfigModeType.fromMode(savedMode);
    } on ValueTryingToGetDoesNotExistError {
      return StyleConfigModeType.initial;
    }
  }

  Future<void> selectMode(StyleConfigModeType mode) async {
    await _localStorageProvider.setValue(themeModeKey, mode.mode);
  }

  void updateStyleConfig(StyleConfigModeType mode) {
    final getIt = GetIt.instance;
    if (getIt.isRegistered<ThemeData>()) {
      getIt.unregister<ThemeData>();
    }
    getIt.registerSingleton<ThemeData>(TejaraTheme.lightTheme);
  }
}
