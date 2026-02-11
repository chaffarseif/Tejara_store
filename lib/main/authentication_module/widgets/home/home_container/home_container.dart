import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:tejara_store/main/authentication_module/widgets/home/home_presentation/home_presentation.dart';

@RoutePage()
class HomeContainer extends HookWidget {
  const HomeContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return HomePresentation();
  }
}
