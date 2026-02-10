import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tejara_store/core/routing/bloc/router_bloc.dart';
import 'package:tejara_store/core/routing/routers/app_router.dart';
import 'package:tejara_store/main/authentication_module/bloc/authentication_bloc.dart';

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

    void routeToOnboardingPage() {
      context.read<RouterBloc>().add(
        RoutingEventGoToOnBoarding(context: context),
      );
    }

    void routeToSplashPage() {
      context.read<RouterBloc>().add(RoutingEventGoToSplash(context: context));
    }

    void routeToLoginPage() {
      context.read<RouterBloc>().add(RoutingEventGoToLogin(context: context));
    }

    void handleRoutingWhenUserLoggedIn(AuthenticationStateLoggedIn state) {
      if (!state.onBoardingSeen) {
        routeToOnboardingPage();
      } else if (state.user.isFirstTime) {
        routeToLoginPage();
      } else {
        routeToHomePage();
      }
    }

    void handleRoutingWhenUserLoggedOut(AuthenticationStateLoggedOut state) {
      context.read<RouterBloc>().add(
        RoutingEventGoToRouterPath(
          context: context,
          routerPath: state.routerPath,
        ),
      );
    }

    void routeToPageByState(AuthenticationState? state) {
      if (state is AuthenticationStateIsLoading) {
        routeToSplashPage();
      } else if (state is AuthenticationStateLoggedIn) {
        handleRoutingWhenUserLoggedIn(state);
      } else if (state is AuthenticationStateLoggedOut) {
        handleRoutingWhenUserLoggedOut(state);
      }
    }

    return BlocListener<AuthenticationBloc, AuthenticationState?>(
      listener: (BuildContext context, AuthenticationState? state) {
        routeToPageByState(state);
      },
      child: const AutoRouter(),
    );
  }
}
