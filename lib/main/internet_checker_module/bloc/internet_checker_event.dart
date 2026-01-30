import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

@immutable
abstract class InternetCheckerEvent extends Equatable {
  const InternetCheckerEvent();
}

@immutable
class InternetCheckerEventCheckConnection extends InternetCheckerEvent {
  const InternetCheckerEventCheckConnection();

  @override
  List<Object?> get props => [];
}

@immutable
class InternetCheckerEventUpdateInternetConnectionState
    extends InternetCheckerEvent {
  final bool isConnected;
  const InternetCheckerEventUpdateInternetConnectionState({
    required this.isConnected,
  });

  @override
  List<Object?> get props => [isConnected];
}
