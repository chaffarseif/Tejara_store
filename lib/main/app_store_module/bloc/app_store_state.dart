import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

@immutable
abstract class AppStoreState extends Equatable {
  const AppStoreState();
}

@immutable
class AppStoreStateUpToDate extends AppStoreState {
  const AppStoreStateUpToDate() : super();

  @override
  List<Object?> get props => [];
}

@immutable
class AppStoreStateUpdateAvailable extends AppStoreState {
  final String? installedVersion;
  final String? appStoreVersion;

  const AppStoreStateUpdateAvailable({
    required this.installedVersion,
    required this.appStoreVersion,
  }) : super();

  @override
  List<Object?> get props => [installedVersion, appStoreVersion];
}
