import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tejara_store/core/routing/bloc/router_bloc.dart';
import 'package:tejara_store/core/routing/routers/app_router.dart';
import 'package:tejara_store/main/authentication_module/bloc/authentication_bloc.dart';
import 'package:tejara_store/main/authentication_module/models/authentication_sign_in_provider.dart';

@RoutePage()
class RoutingListenerContainer extends StatelessWidget {
  const RoutingListenerContainer({super.key});

  @override
  Widget build(BuildContext context) {
    void routeToHomePage() {
      context.read<RouterBloc>().add(
        RoutingEventGoToRouterPath(
          context: context,
          routerPath: homeRouteContainer,
        ),
      );
    }

    void routeToLoginPage() {
      context.read<RouterBloc>().add(RoutingEventGoToLogin(context: context));
    }

    void handleRoutingWhenUserLoggedIn(AuthenticationStateLoggedIn state) {}
    void handleRoutingWhenUserLoggedOut(AuthenticationStateLoggedOut state) {
      context.read<RouterBloc>().add(
        RoutingEventGoToRouterPath(
          context: context,
          routerPath: state.routerPath,
        ),
      );
    }

    return const AutoRouter();
  }
}
