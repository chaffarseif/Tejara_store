import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:karma_design_system_mobile/configs/style_config_mode.dart';

@immutable
abstract class ThemeSelectorEvent extends Equatable {
  const ThemeSelectorEvent();
}

@immutable
class ThemeSelectorEventCheckTheme extends ThemeSelectorEvent {
  const ThemeSelectorEventCheckTheme();

  @override
  List<Object?> get props => [];
}

@immutable
class ThemeSelectorEventSelectTheme extends ThemeSelectorEvent {
  final StyleConfigModeType mode;

  const ThemeSelectorEventSelectTheme({required this.mode});

  @override
  List<Object> get props => [mode];
}

@immutable
class ThemeSelectorEventClearTheme extends ThemeSelectorEvent {
  const ThemeSelectorEventClearTheme();

  @override
  List<Object?> get props => [];
}
