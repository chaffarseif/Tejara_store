part of 'router_bloc.dart';

abstract class RouterState extends Equatable {
  const RouterState();
}

class RouterInitialState extends RouterState {
  const RouterInitialState();
  @override
  List<Object> get props => [];
}
