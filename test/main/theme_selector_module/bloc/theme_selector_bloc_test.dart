import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:karma_design_system_mobile/configs/style_config_mode.dart';
import 'package:mocktail/mocktail.dart';
import 'package:tejara_store/main/theme_selector_module/bloc/theme_selector_module_bloc.dart';
import 'package:tejara_store/main/theme_selector_module/bloc/theme_selector_module_event.dart';
import 'package:tejara_store/main/theme_selector_module/bloc/theme_selector_module_state.dart';
import 'package:tejara_store/main/theme_selector_module/service/theme_selector_service.dart';

class MockThemeSelectorService extends Mock implements ThemeSelectorService {}

void main() {
  late ThemeSelectorService themeSelectorService;

  group('ThemeSelectorBloc', () {
    setUp(() {
      themeSelectorService = MockThemeSelectorService();
    });

    test('initial state is ThemeSelectorStateLoading', () {
      expect(
        ThemeSelectorBloc(themeSelectorService).state,
        const ThemeSelectorStateLoading(),
      );
    });

    group('ThemeSelectorEventCheckTheme Event', () {
      blocTest(
        'should emits ThemeSelectorStateLight when getSelectedMode returns light',
        setUp: () {
          when(
            () => themeSelectorService.getSelectedMode(),
          ).thenAnswer((_) async => StyleConfigModeType.light);
          when(
            () => themeSelectorService.updateStyleConfig(
              StyleConfigModeType.light,
            ),
          ).thenReturn(null);
        },
        build: () => ThemeSelectorBloc(themeSelectorService),
        act: (bloc) {
          bloc.add(ThemeSelectorEventCheckTheme());
        },
        expect: () => [const ThemeSelectorStateLight()],
        verify: (bloc) {
          verify(() => themeSelectorService.getSelectedMode()).called(1);
          verify(
            () => themeSelectorService.updateStyleConfig(
              StyleConfigModeType.light,
            ),
          ).called(1);
        },
      );

      blocTest(
        'should emits ThemeSelectorStateDark when getSelectedMode returns dark',
        setUp: () {
          when(
            () => themeSelectorService.getSelectedMode(),
          ).thenAnswer((_) async => StyleConfigModeType.dark);
          when(
            () => themeSelectorService.updateStyleConfig(
              StyleConfigModeType.dark,
            ),
          ).thenReturn(null);
        },
        build: () => ThemeSelectorBloc(themeSelectorService),
        act: (bloc) {
          bloc.add(ThemeSelectorEventCheckTheme());
        },
        expect: () => [const ThemeSelectorStateDark()],
        verify: (bloc) {
          verify(() => themeSelectorService.getSelectedMode()).called(1);
          verify(
            () => themeSelectorService.updateStyleConfig(
              StyleConfigModeType.dark,
            ),
          ).called(1);
        },
      );

      blocTest(
        'should emits ThemeSelectorStateInitial when getSelectedMode returns initial',
        setUp: () {
          when(
            () => themeSelectorService.getSelectedMode(),
          ).thenAnswer((_) async => StyleConfigModeType.initial);
          when(
            () => themeSelectorService.updateStyleConfig(
              StyleConfigModeType.initial,
            ),
          ).thenReturn(null);
        },
        build: () => ThemeSelectorBloc(themeSelectorService),
        act: (bloc) {
          bloc.add(ThemeSelectorEventCheckTheme());
        },
        expect: () => [const ThemeSelectorStateInitial()],
        verify: (bloc) {
          verify(() => themeSelectorService.getSelectedMode()).called(1);
          verify(
            () => themeSelectorService.updateStyleConfig(
              StyleConfigModeType.initial,
            ),
          ).called(1);
        },
      );
    });

    group('ThemeSelectorEventSelectTheme Event', () {
      blocTest(
        'should selectMode StyleConfigModeType.light and emits ThemeSelectorStateLight when ThemeSelectorEventSelectTheme is added with light mode',
        setUp: () {
          when(
            () => themeSelectorService.selectMode(StyleConfigModeType.light),
          ).thenAnswer((_) async => Future.value());
          when(
            () => themeSelectorService.updateStyleConfig(
              StyleConfigModeType.light,
            ),
          ).thenReturn(null);
        },
        build: () => ThemeSelectorBloc(themeSelectorService),
        act: (bloc) {
          bloc.add(
            ThemeSelectorEventSelectTheme(mode: StyleConfigModeType.light),
          );
        },
        expect: () => [const ThemeSelectorStateLight()],
        verify: (bloc) {
          verify(
            () => themeSelectorService.selectMode(StyleConfigModeType.light),
          ).called(1);
          verify(
            () => themeSelectorService.updateStyleConfig(
              StyleConfigModeType.light,
            ),
          ).called(1);
        },
      );

      blocTest(
        'should selectMode StyleConfigModeType.dark and emits ThemeSelectorStateDark when ThemeSelectorEventSelectTheme is added with dark mode',
        setUp: () {
          when(
            () => themeSelectorService.selectMode(StyleConfigModeType.dark),
          ).thenAnswer((_) async => Future.value());
          when(
            () => themeSelectorService.updateStyleConfig(
              StyleConfigModeType.dark,
            ),
          ).thenReturn(null);
        },
        build: () => ThemeSelectorBloc(themeSelectorService),
        act: (bloc) {
          bloc.add(
            ThemeSelectorEventSelectTheme(mode: StyleConfigModeType.dark),
          );
        },
        expect: () => [const ThemeSelectorStateDark()],
        verify: (bloc) {
          verify(
            () => themeSelectorService.selectMode(StyleConfigModeType.dark),
          ).called(1);
          verify(
            () => themeSelectorService.updateStyleConfig(
              StyleConfigModeType.dark,
            ),
          ).called(1);
        },
      );
    });

    group('ThemeSelectorEventClearTheme', () {
      blocTest(
        'should emit ThemeSelectorStateInitial when ThemeSelectorEventClearTheme is added',
        setUp: () {
          when(
            () => themeSelectorService.updateStyleConfig(
              StyleConfigModeType.initial,
            ),
          ).thenReturn(null);
        },
        build: () => ThemeSelectorBloc(themeSelectorService),
        act: (bloc) {
          bloc.add(ThemeSelectorEventClearTheme());
        },
        expect: () => [const ThemeSelectorStateInitial()],
        verify: (bloc) {
          verify(
            () => themeSelectorService.updateStyleConfig(
              StyleConfigModeType.initial,
            ),
          ).called(1);
        },
      );
    });
  });
}
