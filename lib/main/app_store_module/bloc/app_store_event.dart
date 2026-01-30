import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

@immutable
abstract class AppStoreEvent extends Equatable {
  const AppStoreEvent();
}

@immutable
class AppStoreEventCheckForUpdates extends AppStoreEvent {
  const AppStoreEventCheckForUpdates();

  @override
  List<Object?> get props => [];
}

@immutable
class AppStoreEventUpdateApplication extends AppStoreEvent {
  const AppStoreEventUpdateApplication();

  @override
  List<Object?> get props => [];
}
