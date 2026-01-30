import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tejara_store/main/app_life_cycle_module/bloc/app_life_cycle_bloc.dart';
import 'package:tejara_store/main/app_life_cycle_module/bloc/app_life_cycle_event.dart';

@RoutePage()
class AppLifeCycleContainer extends StatefulWidget {
  const AppLifeCycleContainer({super.key});

  @override
  State<AppLifeCycleContainer> createState() => _AppLifeCycleContainerState();
}

class _AppLifeCycleContainerState extends State<AppLifeCycleContainer>
    with WidgetsBindingObserver {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    super.dispose();
    WidgetsBinding.instance.removeObserver(this);
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    switch (state) {
      case AppLifecycleState.resumed:
        _movedToForeground();
      case AppLifecycleState.inactive:
      case AppLifecycleState.hidden:
      case AppLifecycleState.paused:
      case AppLifecycleState.detached:
        _movedToBackground();
    }
  }

  void _movedToForeground() {
    context.read<AppLifeCycleBloc>().add(AppLifeCycleEventMovedToForeground());
  }

  void _movedToBackground() {
    context.read<AppLifeCycleBloc>().add(AppLifeCycleEventMovedToBackground());
  }

  @override
  Widget build(BuildContext context) {
    return AutoRouter();
  }
}
