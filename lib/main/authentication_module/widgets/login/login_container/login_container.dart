import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:tejara_store/core/routing/bloc/router_bloc.dart';
import 'package:tejara_store/main/authentication_module/widgets/login/login_presentation/login_presentation.dart';

@RoutePage()
class LoginContainer extends HookWidget {
  const LoginContainer({super.key});

  @override
  Widget build(BuildContext context) {
    goToRegister() {
      context.read<RouterBloc>().add(
        RoutingEventGoToRegister(context: context),
      );
    }

    goToForgotPassword() {
      context.read<RouterBloc>().add(
        RoutingEventGoToForgotPassword(context: context),
      );
    }

    return LoginPresentation(
      goToRegister: goToRegister,
      goToForgotPassword: goToForgotPassword,
    );
  }
}
