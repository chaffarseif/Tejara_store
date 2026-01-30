import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:tejara_store/main/app_life_cycle_module/bloc/app_life_cycle_bloc.dart';
import 'package:tejara_store/main/app_life_cycle_module/bloc/app_life_cycle_event.dart';
import 'package:tejara_store/main/app_life_cycle_module/bloc/app_life_cycle_state.dart';

void main() {
  group('AppLifeCycleBloc', () {
    test('initial state is AppLifeCycleStateForeground', () {
      expect(AppLifeCycleBloc().state, AppLifeCycleStateForeground());
    });
    group('AppLifeCycleEventMovedToForeground Event', () {
      blocTest(
        'should emits AppLifeCycleStateForeground',
        build: () => AppLifeCycleBloc(),
        act: (bloc) => bloc.add(const AppLifeCycleEventMovedToForeground()),
        expect: () => [AppLifeCycleStateForeground()],
      );
    });
    group('AppLifeCycleEventMovedToBackground Event', () {
      blocTest(
        'should emits AppLifeCycleStateBackground',
        build: () => AppLifeCycleBloc(),
        act: (bloc) => bloc.add(const AppLifeCycleEventMovedToBackground()),
        expect: () => [AppLifeCycleStateBackground()],
      );
    });
  });
}
