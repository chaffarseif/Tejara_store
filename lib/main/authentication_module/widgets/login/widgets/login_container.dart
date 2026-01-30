import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:tejara_store/main/authentication_module/widgets/login/widgets/login_presentation.dart';

@RoutePage()
class LoginContainer extends HookWidget {
  const LoginContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return const LoginPresentation();
  }
}
