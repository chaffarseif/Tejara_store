import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:karma_design_system_mobile/providers/router_providers/models/router_path.model.dart';
import 'package:karma_design_system_mobile/providers/router_providers/router.provider.dart';

part 'router_event.dart';
part 'router_state.dart';

class RouterBloc extends Bloc<RouterEvent, RouterState> {
  final RouterProvider routerProvider;
  RouterBloc(this.routerProvider) : super(RouterInitialState()) {
    on<RoutingEventGoToRouterPath>((event, emit) async {
      await routerProvider.replaceRoute(event.context, event.routerPath);
    });
    on<RoutingEventGoBack>((event, emit) async {
      await routerProvider.goBack(event.context);
    });
  }
}
