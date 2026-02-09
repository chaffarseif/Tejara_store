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
    print('--- [RoutingListener] Widget Built ---');
    void routeToHomePage() {
      print('--- [Routing] Navigating to Home Page ---');
      context.read<RouterBloc>().add(
        RoutingEventGoToRouterPath(
          context: context,
          routerPath: homeRouteContainer,
        ),
      );
    }

    void routeToOnboardingPage() {
      print('--- [Routing] Navigating to Onboarding Page ---');
      context.read<RouterBloc>().add(
        RoutingEventGoToOnBoarding(context: context),
      );
    }

    void routeToSplashPage() {
      print('--- [Routing] Navigating to Splash Page ---');
      context.read<RouterBloc>().add(RoutingEventGoToSplash(context: context));
    }

    void routeToLoginPage() {
      print('--- [Routing] Navigating to Login Page ---');
      context.read<RouterBloc>().add(RoutingEventGoToLogin(context: context));
    }

    void handleRoutingWhenUserLoggedIn(AuthenticationStateLoggedIn state) {
      print('--- [State] AuthenticationStateLoggedIn ---');
      print('--- [State Info] onBoardingSeen: ${state.onBoardingSeen}');
      print('--- [State Info] isFirstTime: ${state.user.isFirstTime}');

      // Afficher le splash d'abord
      routeToSplashPage();

      // Puis naviguer vers la page appropriée après un délai
      Future.delayed(const Duration(seconds: 3), () {
        if (!state.onBoardingSeen) {
          print('--- [Logic] Decision: Show Onboarding ---');
          routeToOnboardingPage();
        } else if (state.user.isFirstTime) {
          print('--- [Logic] Decision: Show Login (First Time) ---');
          routeToLoginPage();
        } else {
          print('--- [Logic] Decision: Show Home ---');
          routeToHomePage();
        }
      });
    }

    void handleRoutingWhenUserLoggedOut(AuthenticationStateLoggedOut state) {
      print('--- [State] AuthenticationStateLoggedOut ---');
      print('--- [Routing] Navigating to: ${state.routerPath.basePath}');
      context.read<RouterBloc>().add(
        RoutingEventGoToRouterPath(
          context: context,
          routerPath: state.routerPath,
        ),
      );
    }

    void routeToPageByState(AuthenticationState? state) {
      print('--- [RoutingListener] Received State: $state ---');
      if (state is AuthenticationStateLoggedIn) {
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
