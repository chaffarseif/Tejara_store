import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:tejara_store/core/assets/Text_strings.dart';
import 'package:tejara_store/core/assets/sizes.dart';

class LoginPresentation extends HookWidget {
  final VoidCallback goToRegister;
  final VoidCallback goToForgotPassword;
  const LoginPresentation({
    super.key,
    required this.goToRegister,
    required this.goToForgotPassword,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Column(
            children: [
              Text(
                TejaraTexts.loginTitle,
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              SizedBox(height: TejaraSizes.sm),
              Text(
                TejaraTexts.loginSubTitle,
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
