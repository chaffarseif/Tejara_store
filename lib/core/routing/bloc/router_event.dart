part of 'router_bloc.dart';

abstract class RouterEvent extends Equatable {
  final BuildContext context;
  const RouterEvent({required this.context});

  @override
  List<Object> get props => [context];
}

class RoutingEventGoToRouterPath extends RouterEvent {
  final RouterPath routerPath;
  const RoutingEventGoToRouterPath({
    required super.context,
    required this.routerPath,
  });
  @override
  List<Object> get props => [context, routerPath];
}

class RoutingEventGoBack extends RouterEvent {
  const RoutingEventGoBack({required super.context});
}
