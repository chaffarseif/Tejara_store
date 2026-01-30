import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tejara_store/main/app_life_cycle_module/bloc/app_life_cycle_event.dart';
import 'package:tejara_store/main/app_life_cycle_module/bloc/app_life_cycle_state.dart';

class AppLifeCycleBloc extends Bloc<AppLifeCycleEvent, AppLifeCycleState> {
  AppLifeCycleBloc() : super(AppLifeCycleStateForeground()) {
    on<AppLifeCycleEventMovedToForeground>((event, emit) {
      emit(AppLifeCycleStateForeground());
    });

    on<AppLifeCycleEventMovedToBackground>((event, emit) {
      emit(AppLifeCycleStateBackground());
    });
  }
}
