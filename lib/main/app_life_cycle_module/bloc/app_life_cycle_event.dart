import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

@immutable
abstract class AppLifeCycleEvent extends Equatable {
  const AppLifeCycleEvent();
}

@immutable
class AppLifeCycleEventMovedToForeground extends AppLifeCycleEvent {
  const AppLifeCycleEventMovedToForeground();

  @override
  List<Object?> get props => [];
}

@immutable
class AppLifeCycleEventMovedToBackground extends AppLifeCycleEvent {
  const AppLifeCycleEventMovedToBackground();

  @override
  List<Object?> get props => [];
}
