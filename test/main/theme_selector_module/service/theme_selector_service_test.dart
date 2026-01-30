import 'package:faker/faker.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:karma_design_system_mobile/karma_design_system_mobile.dart';
import 'package:mocktail/mocktail.dart';
import 'package:tejara_store/main/theme_selector_module/service/theme_selector_service.dart';

void main() {
  group('ThemeSelectorService', () {
    late LocalStorageProvider localStorageProvider;
    late ThemeSelectorService themeSelectorService;

    setUp(() {
      localStorageProvider = MockLocalStorageProvider();
      themeSelectorService = ThemeSelectorService(
        localStorageProvider: localStorageProvider,
      );
    });

    group('getSelectedMode', () {
      group('StyleConfigModeType.initial', () {
        test(
          'should return StyleConfigModeType.initial if no value in storage',
          () async {
            // arrange
            when(
              () => localStorageProvider.getValue(
                ThemeSelectorService.themeModeKey,
              ),
            ).thenAnswer((_) async => null);

            // act
            final result = await themeSelectorService.getSelectedMode();

            // assert
            expect(result, StyleConfigModeType.initial);
            verify(
              () => localStorageProvider.getValue(
                ThemeSelectorService.themeModeKey,
              ),
            ).called(1);
          },
        );

        test(
          'should return StyleConfigModeType.initial for unknown value',
          () async {
            // arrange
            when(
              () => localStorageProvider.getValue(
                ThemeSelectorService.themeModeKey,
              ),
            ).thenAnswer((_) async => 'unknown');

            // act
            final result = await themeSelectorService.getSelectedMode();

            // assert
            expect(result, StyleConfigModeType.initial);
            verify(
              () => localStorageProvider.getValue(
                ThemeSelectorService.themeModeKey,
              ),
            ).called(1);
          },
        );

        test(
          'should return StyleConfigModeType.initial when ValueTryingToGetDoesNotExistError is thrown',
          () async {
            // arrange
            when(
              () => localStorageProvider.getValue(
                ThemeSelectorService.themeModeKey,
              ),
            ).thenThrow(const ValueTryingToGetDoesNotExistError());

            // act
            final result = await themeSelectorService.getSelectedMode();

            // assert
            expect(result, StyleConfigModeType.initial);
            verify(
              () => localStorageProvider.getValue(
                ThemeSelectorService.themeModeKey,
              ),
            ).called(1);
          },
        );
      });

      group('StyleConfigModeType.light', () {
        test(
          'should return StyleConfigModeType.light when value is light',
          () async {
            // arrange
            when(
              () => localStorageProvider.getValue(
                ThemeSelectorService.themeModeKey,
              ),
            ).thenAnswer((_) async => StyleConfigModeType.light.mode);

            // act
            final result = await themeSelectorService.getSelectedMode();

            // assert
            expect(result, StyleConfigModeType.light);
            verify(
              () => localStorageProvider.getValue(
                ThemeSelectorService.themeModeKey,
              ),
            ).called(1);
          },
        );
      });

      group('StyleConfigModeType.dark', () {
        test(
          'should return StyleConfigModeType.dark when value is dark',
          () async {
            // arrange
            when(
              () => localStorageProvider.getValue(
                ThemeSelectorService.themeModeKey,
              ),
            ).thenAnswer((_) async => StyleConfigModeType.dark.mode);

            // act
            final result = await themeSelectorService.getSelectedMode();

            // assert
            expect(result, StyleConfigModeType.dark);
            verify(
              () => localStorageProvider.getValue(
                ThemeSelectorService.themeModeKey,
              ),
            ).called(1);
          },
        );
      });
    });

    group('selectMode', () {
      test('should store selected mode to local storage', () async {
        // arrange
        final selectedMode = faker.randomGenerator.element(
          StyleConfigModeType.values,
        );
        when(
          () => localStorageProvider.setValue(
            ThemeSelectorService.themeModeKey,
            selectedMode.mode,
          ),
        ).thenAnswer((_) async {});

        // act
        await themeSelectorService.selectMode(selectedMode);

        // assert
        verify(
          () => localStorageProvider.setValue(
            ThemeSelectorService.themeModeKey,
            selectedMode.mode,
          ),
        ).called(1);
      });
    });

    group('updateStyleConfig', () {
      test('should update StyleConfig singleton in GetIt', () {
        // arrange
        final selectedMode = faker.randomGenerator.element(
          StyleConfigModeType.values,
        );

        // act
        themeSelectorService.updateStyleConfig(selectedMode);

        // assert
        expect(GetIt.instance<StyleConfig>().selectedMode, selectedMode);
      });
    });
  });
}
