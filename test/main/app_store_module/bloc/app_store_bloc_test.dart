import 'package:bloc_test/bloc_test.dart';
import 'package:faker/faker.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:karma_design_system_mobile/karma_design_system_mobile.dart';
import 'package:mocktail/mocktail.dart';
import 'package:tejara_store/main/app_store_module/bloc/app_store_bloc.dart';
import 'package:tejara_store/main/app_store_module/bloc/app_store_event.dart';
import 'package:tejara_store/main/app_store_module/bloc/app_store_state.dart';

void main() {
  late AppStoreProvider appStoreProvider;

  setUp(() => {appStoreProvider = MockAppStoreProvider()});

  group('AppStoreBloc', () {
    test('initial state is AppStoreStateUpToDate', () {
      expect(AppStoreBloc(appStoreProvider).state, AppStoreStateUpToDate());
    });
    group('AppStoreEventCheckForUpdates Event', () {
      blocTest(
        'should emits AppStoreStateUpToDate when no updates are available',
        setUp: () {
          when(
            () => appStoreProvider.isAppStoreVersionNewerThanInstalled(),
          ).thenAnswer((_) => Future.value(false));
        },
        build: () => AppStoreBloc(appStoreProvider),
        act: (bloc) => bloc.add(const AppStoreEventCheckForUpdates()),
        expect: () => [AppStoreStateUpToDate()],
        verify: (_) {
          verify(
            () => appStoreProvider.isAppStoreVersionNewerThanInstalled(),
          ).called(1);
        },
      );

      final installedVersion = faker.randomGenerator.string(10);
      final appStoreVersion = faker.randomGenerator.string(10);
      blocTest(
        'should emits AppStoreStateUpdateAvailable when updates are available',
        setUp: () {
          when(
            () => appStoreProvider.isAppStoreVersionNewerThanInstalled(),
          ).thenAnswer((_) => Future.value(true));
          when(
            () => appStoreProvider.getInstalledVersion(),
          ).thenAnswer((_) async => Future.value(installedVersion));
          when(
            () => appStoreProvider.getAppStoreVersion(),
          ).thenAnswer((_) async => Future.value(appStoreVersion));
        },
        build: () => AppStoreBloc(appStoreProvider),
        act: (bloc) => bloc.add(const AppStoreEventCheckForUpdates()),
        expect: () => [
          AppStoreStateUpdateAvailable(
            installedVersion: installedVersion,
            appStoreVersion: appStoreVersion,
          ),
        ],
        verify: (_) {
          verify(
            () => appStoreProvider.isAppStoreVersionNewerThanInstalled(),
          ).called(1);
          verify(() => appStoreProvider.getInstalledVersion()).called(1);
          verify(() => appStoreProvider.getAppStoreVersion()).called(1);
        },
      );
    });
    group('AppStoreEventUpdateApplication Event', () {
      blocTest(
        'AppStoreEventUpdateApplication',
        setUp: () {
          when(
            () => appStoreProvider.updateApplication(),
          ).thenAnswer((_) => Future.value(null));
        },
        build: () => AppStoreBloc(appStoreProvider),
        act: (bloc) => bloc.add(const AppStoreEventUpdateApplication()),
        verify: (_) {
          verify(() => appStoreProvider.updateApplication()).called(1);
        },
      );
    });
  });
}
