import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:karma_design_system_mobile/configs/style_config_mode.dart';
import 'package:tejara_store/core/assets/custom_colors.dart';
import 'package:tejara_store/main/theme_selector_module/bloc/theme_selector_module_bloc.dart';
import 'package:tejara_store/main/theme_selector_module/bloc/theme_selector_module_event.dart';
import 'package:tejara_store/main/theme_selector_module/bloc/theme_selector_module_state.dart';
import 'package:tejara_store/main/theme_selector_module/widgets/theme_selector_presentation/theme_selector_presentation.dart';

@RoutePage()
class ThemeSelectorContainer extends HookWidget {
  const ThemeSelectorContainer({super.key});

  @override
  Widget build(BuildContext context) {
    checkForSelectedTheme() {
      context.read<ThemeSelectorBloc>().add(
        const ThemeSelectorEventCheckTheme(),
      );
    }

    useEffect(() {
      checkForSelectedTheme();
      return null;
    }, []);

    selectThemeMode(StyleConfigModeType mode) {
      context.read<ThemeSelectorBloc>().add(
        ThemeSelectorEventSelectTheme(mode: mode),
      );
    }

    return BlocBuilder<ThemeSelectorBloc, ThemeSelectorState>(
      builder: (context, state) {
        if (state is ThemeSelectorStateLoading) {
          return Container(
            color: TejaraColors.white,
            child: Center(
              child: SizedBox(
                width: 50,
                height: 50,
                child: CircularProgressIndicator(
                  color: TejaraColors.primary,
                  strokeWidth: 3,
                ),
              ),
            ),
          );
        } else if (state is ThemeSelectorStateLight ||
            state is ThemeSelectorStateDark) {
          return const AutoRouter();
        } else {
          final platformBrightness = MediaQuery.of(context).platformBrightness;
          final defaultMode = platformBrightness == Brightness.dark
              ? StyleConfigModeType.dark
              : StyleConfigModeType.light;

          return ThemeSelectorPresentation(
            defaultMode: defaultMode,
            onSelectMode: selectThemeMode,
          );
        }
      },
    );
  }
}
