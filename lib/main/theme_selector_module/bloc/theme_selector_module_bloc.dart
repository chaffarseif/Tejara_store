import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:karma_design_system_mobile/configs/style_config_mode.dart';
import 'package:tejara_store/main/theme_selector_module/bloc/theme_selector_module_event.dart';
import 'package:tejara_store/main/theme_selector_module/bloc/theme_selector_module_state.dart';
import 'package:tejara_store/main/theme_selector_module/service/theme_selector_service.dart';

class ThemeSelectorBloc extends Bloc<ThemeSelectorEvent, ThemeSelectorState> {
  final ThemeSelectorService _themeSelectorService;

  ThemeSelectorBloc(this._themeSelectorService)
    : super(const ThemeSelectorStateLoading()) {
    on<ThemeSelectorEventCheckTheme>((event, emit) async {
      StyleConfigModeType mode = await _themeSelectorService.getSelectedMode();

      _themeSelectorService.updateStyleConfig(mode);

      ThemeSelectorState state = _getThemeSelectorStateFromMode(mode);
      emit(state);
    });

    on<ThemeSelectorEventSelectTheme>((event, emit) async {
      await _themeSelectorService.selectMode(event.mode);

      _themeSelectorService.updateStyleConfig(event.mode);

      ThemeSelectorState state = _getThemeSelectorStateFromMode(event.mode);
      emit(state);
    });

    on<ThemeSelectorEventClearTheme>((event, emit) async {
      _themeSelectorService.updateStyleConfig(StyleConfigModeType.initial);

      emit(const ThemeSelectorStateInitial());
    });
  }

  ThemeSelectorState _getThemeSelectorStateFromMode(StyleConfigModeType mode) {
    switch (mode) {
      case StyleConfigModeType.light:
        return const ThemeSelectorStateLight();
      case StyleConfigModeType.dark:
        return const ThemeSelectorStateDark();
      case StyleConfigModeType.initial:
        return const ThemeSelectorStateInitial();
    }
  }
}
