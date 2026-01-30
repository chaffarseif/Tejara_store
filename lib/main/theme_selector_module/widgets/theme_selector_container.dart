import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:tejara_store/main/theme_selector_module/widgets/theme_selector_presentation.dart';

@RoutePage()
class ThemeSelectorContainer extends HookWidget {
  const ThemeSelectorContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return const ThemeSelectorPresentation();
  }
}
