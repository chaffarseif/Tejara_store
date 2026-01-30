import 'dart:async';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:karma_design_system_mobile/karma_design_system_mobile.dart';
import 'package:mocktail/mocktail.dart';
import 'package:tejara_store/main/app_life_cycle_module/bloc/app_life_cycle_bloc.dart';
import 'package:tejara_store/main/app_life_cycle_module/bloc/app_life_cycle_event.dart';
import 'package:tejara_store/main/app_life_cycle_module/bloc/app_life_cycle_state.dart';
import 'package:tejara_store/main/internet_checker_module/bloc/internet_checker_bloc.dart';
import 'package:tejara_store/main/internet_checker_module/bloc/internet_checker_event.dart';
import 'package:tejara_store/main/internet_checker_module/bloc/internet_checker_state.dart';

class MockAppLifeCycleBloc
    extends MockBloc<AppLifeCycleEvent, AppLifeCycleState>
    implements AppLifeCycleBloc {}

void main() {
  late InternetCheckerProvider internetCheckerProvider;
  late AppLifeCycleBloc appLifeCycleBloc;
  late StreamController<bool> onInternetReconnectedStreamController;

  group('InternetCheckerBloc', () {
    setUp(() {
      internetCheckerProvider = MockInternetCheckerProvider();
      appLifeCycleBloc = MockAppLifeCycleBloc();
      onInternetReconnectedStreamController = StreamController<bool>();
      when(
        () => internetCheckerProvider.onInternetConnectionStatusChange(),
      ).thenAnswer((_) => onInternetReconnectedStreamController.stream);
    });

    test('initial state is InternetCheckerStateConnected', () {
      expect(
        InternetCheckerBloc(internetCheckerProvider, appLifeCycleBloc).state,
        InternetCheckerStateConnected(),
      );
    });

    group('InternetCheckerEventCheckConnection Event', () {
      blocTest(
        'should emits InternetCheckerStateConnected if connected',
        setUp: (() {
          when(
            () => internetCheckerProvider.isInternetConnected(),
          ).thenAnswer((_) async => Future.value(true));
        }),
        build: () =>
            InternetCheckerBloc(internetCheckerProvider, appLifeCycleBloc),
        act: (bloc) {
          bloc.add(InternetCheckerEventCheckConnection());
        },
        expect: () => [InternetCheckerStateConnected()],
        verify: (bloc) {
          verify(() => internetCheckerProvider.isInternetConnected()).called(1);
        },
      );
      blocTest(
        'should emits InternetCheckerStateDisconnected if not connected',
        setUp: (() {
          when(
            () => internetCheckerProvider.isInternetConnected(),
          ).thenAnswer((_) async => Future.value(false));
        }),
        build: () =>
            InternetCheckerBloc(internetCheckerProvider, appLifeCycleBloc),
        act: (bloc) {
          bloc.add(InternetCheckerEventCheckConnection());
        },
        expect: () => [InternetCheckerStateDisconnected()],
        verify: (bloc) {
          verify(() => internetCheckerProvider.isInternetConnected()).called(1);
        },
      );
    });

    group('InternetCheckerEventUpdateInternetConnectionState Event', () {
      blocTest(
        'should emits InternetCheckerStateConnected if connected',
        build: () =>
            InternetCheckerBloc(internetCheckerProvider, appLifeCycleBloc),
        act: (bloc) {
          bloc.add(
            InternetCheckerEventUpdateInternetConnectionState(
              isConnected: true,
            ),
          );
        },
        expect: () => [InternetCheckerStateConnected()],
      );
      blocTest(
        'should emits InternetCheckerStateDisconnected if not connected',
        build: () =>
            InternetCheckerBloc(internetCheckerProvider, appLifeCycleBloc),
        act: (bloc) {
          bloc.add(
            InternetCheckerEventUpdateInternetConnectionState(
              isConnected: false,
            ),
          );
        },
        expect: () => [InternetCheckerStateDisconnected()],
      );
    });

    group('internetCheckerProvider.onInternetConnectionStatusChange stream', () {
      stubAppLifeCycleBlocWithState(AppLifeCycleState state) {
        whenListen(
          appLifeCycleBloc,
          Stream.fromIterable([state]),
          initialState: state,
        );
      }

      group('app is in foreground', () {
        blocTest(
          'should emits InternetCheckerStateConnected when onInternetConnectionStatusChange stream is changed to true and app is in foreground',
          setUp: (() {
            stubAppLifeCycleBlocWithState(AppLifeCycleStateForeground());
          }),
          build: () =>
              InternetCheckerBloc(internetCheckerProvider, appLifeCycleBloc),
          act: (bloc) {
            onInternetReconnectedStreamController.add(true);
          },
          expect: () => [InternetCheckerStateConnected()],
        );
        blocTest(
          'should emits InternetCheckerStateDisconnected when onInternetConnectionStatusChange stream is changed to false and app is in foreground',
          setUp: (() {
            stubAppLifeCycleBlocWithState(AppLifeCycleStateForeground());
          }),
          build: () =>
              InternetCheckerBloc(internetCheckerProvider, appLifeCycleBloc),
          act: (bloc) {
            onInternetReconnectedStreamController.add(false);
          },
          expect: () => [InternetCheckerStateDisconnected()],
        );
      });

      group('app is in background', () {
        blocTest(
          'should not change state when onInternetConnectionStatusChange stream is changed to true and app is in background',
          setUp: (() {
            stubAppLifeCycleBlocWithState(AppLifeCycleStateBackground());
          }),
          build: () =>
              InternetCheckerBloc(internetCheckerProvider, appLifeCycleBloc),
          act: (bloc) {
            onInternetReconnectedStreamController.add(true);
          },
          expect: () => [],
        );
        blocTest(
          'should not change state when onInternetConnectionStatusChange stream is changed to false and app is in background',
          setUp: (() {
            stubAppLifeCycleBlocWithState(AppLifeCycleStateBackground());
          }),
          build: () =>
              InternetCheckerBloc(internetCheckerProvider, appLifeCycleBloc),
          act: (bloc) {
            onInternetReconnectedStreamController.add(false);
          },
          expect: () => [],
        );
      });
    });
  });
}
