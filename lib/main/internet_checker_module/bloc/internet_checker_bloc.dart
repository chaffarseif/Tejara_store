import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:karma_design_system_mobile/karma_design_system_mobile.dart';
import 'package:tejara_store/main/app_life_cycle_module/bloc/app_life_cycle_bloc.dart';
import 'package:tejara_store/main/app_life_cycle_module/bloc/app_life_cycle_state.dart';
import 'package:tejara_store/main/internet_checker_module/bloc/internet_checker_event.dart';
import 'package:tejara_store/main/internet_checker_module/bloc/internet_checker_state.dart';

class InternetCheckerBloc
    extends Bloc<InternetCheckerEvent, InternetCheckerState> {
  final InternetCheckerProvider _internetCheckerProvider;
  final AppLifeCycleBloc _appLifeCycleBloc;

  InternetCheckerBloc(this._internetCheckerProvider, this._appLifeCycleBloc)
    : super(InternetCheckerStateConnected()) {
    on<InternetCheckerEventCheckConnection>((event, emit) async {
      final isConnected = await _internetCheckerProvider.isInternetConnected();
      if (isConnected) {
        emit(InternetCheckerStateConnected());
      } else {
        emit(InternetCheckerStateDisconnected());
      }
    });

    on<InternetCheckerEventUpdateInternetConnectionState>((event, emit) {
      if (event.isConnected) {
        emit(InternetCheckerStateConnected());
      } else {
        emit(InternetCheckerStateDisconnected());
      }
    });

    _internetCheckerProvider.onInternetConnectionStatusChange().listen((
      isConnected,
    ) {
      if (_appLifeCycleBloc.state is AppLifeCycleStateForeground) {
        add(
          InternetCheckerEventUpdateInternetConnectionState(
            isConnected: isConnected,
          ),
        );
      }
    });
  }
}
