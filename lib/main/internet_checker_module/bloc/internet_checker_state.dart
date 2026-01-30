import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

@immutable
abstract class InternetCheckerState extends Equatable {
  const InternetCheckerState();
}

@immutable
class InternetCheckerStateConnected extends InternetCheckerState {
  const InternetCheckerStateConnected() : super();

  @override
  List<Object?> get props => [];
}

@immutable
class InternetCheckerStateDisconnected extends InternetCheckerState {
  const InternetCheckerStateDisconnected() : super();

  @override
  List<Object?> get props => [];
}
