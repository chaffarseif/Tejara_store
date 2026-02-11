import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:tejara_store/main/authentication_module/widgets/forget_password/forget_password_presentation/forget_password_presentation.dart';

@RoutePage()
class ForgetPasswordContainer extends HookWidget {
  const ForgetPasswordContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return const ForgetPasswordPresentation();
  }
}
