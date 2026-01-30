import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:tejara_store/main/app_life_cycle_module/bloc/app_life_cycle_bloc.dart';
import 'package:tejara_store/main/app_life_cycle_module/bloc/app_life_cycle_state.dart';
import 'package:tejara_store/main/internet_checker_module/bloc/internet_checker_bloc.dart';
import 'package:tejara_store/main/internet_checker_module/bloc/internet_checker_event.dart';
import 'package:tejara_store/main/internet_checker_module/bloc/internet_checker_state.dart';
import 'package:tejara_store/main/internet_checker_module/widgets/no_internet_connection_presentation.dart';

@RoutePage()
class InternetCheckerContainer extends HookWidget {
  const InternetCheckerContainer({super.key});

  @override
  Widget build(BuildContext context) {
    checkForInternetConnection() {
      context.read<InternetCheckerBloc>().add(
        const InternetCheckerEventCheckConnection(),
      );
    }

    useEffect(() {
      checkForInternetConnection();
      return null;
    }, []);

    return BlocListener<AppLifeCycleBloc, AppLifeCycleState>(
      listener: (context, state) {
        if (state is AppLifeCycleStateForeground) {
          checkForInternetConnection();
        }
      },
      child: BlocBuilder<InternetCheckerBloc, InternetCheckerState>(
        builder: (context, state) {
          if (state is InternetCheckerStateDisconnected) {
            return NoInternetConnectionPresentation();
          } else {
            return const AutoRouter();
          }
        },
      ),
    );
  }
}
