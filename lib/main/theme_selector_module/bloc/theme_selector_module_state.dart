import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

@immutable
abstract class ThemeSelectorState extends Equatable {
  const ThemeSelectorState();
}

@immutable
class ThemeSelectorStateLoading extends ThemeSelectorState {
  const ThemeSelectorStateLoading();

  @override
  List<Object?> get props => [];
}

@immutable
class ThemeSelectorStateInitial extends ThemeSelectorState {
  const ThemeSelectorStateInitial();

  @override
  List<Object?> get props => [];
}

@immutable
class ThemeSelectorStateLight extends ThemeSelectorState {
  const ThemeSelectorStateLight() : super();

  @override
  List<Object?> get props => [];
}

@immutable
class ThemeSelectorStateDark extends ThemeSelectorState {
  const ThemeSelectorStateDark();

  @override
  List<Object?> get props => [];
}
