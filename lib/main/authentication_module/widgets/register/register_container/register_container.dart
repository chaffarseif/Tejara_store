import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:tejara_store/main/authentication_module/widgets/register/register_presentation/register_presentation.dart';

@RoutePage()
class RegisterContainer extends HookWidget {
  const RegisterContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return RegisterPresentation();
  }
}
