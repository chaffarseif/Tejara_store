import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:tejara_store/core/routing/bloc/router_bloc.dart';
import 'package:tejara_store/main/authentication_module/widgets/on_boarding/onboarding_presentation/onBoarding_presentation.dart';

@RoutePage()
class OnboardingContainer extends HookWidget {
  const OnboardingContainer({super.key});

  @override
  Widget build(BuildContext context) {
    goToLogin() {
      context.read<RouterBloc>().add(RoutingEventGoToLogin(context: context));
    }

    return OnboardingPresentation(goToLogin: goToLogin);
  }
}
