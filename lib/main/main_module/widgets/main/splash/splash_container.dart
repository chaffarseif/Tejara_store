import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import 'package:flutter_hooks/flutter_hooks.dart';

import 'package:tejara_store/main/main_module/widgets/main/splash/splash_presentation.dart';

@RoutePage()
class SplashContainer extends HookWidget {
  const SplashContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return SplashPresentation();
  }
}
