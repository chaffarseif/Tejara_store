import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

@immutable
abstract class AppLifeCycleState extends Equatable {
  const AppLifeCycleState();
}

@immutable
class AppLifeCycleStateForeground extends AppLifeCycleState {
  const AppLifeCycleStateForeground() : super();

  @override
  List<Object?> get props => [];
}

@immutable
class AppLifeCycleStateBackground extends AppLifeCycleState {
  const AppLifeCycleStateBackground() : super();

  @override
  List<Object?> get props => [];
}
