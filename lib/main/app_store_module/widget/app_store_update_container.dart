import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:tejara_store/main/app_store_module/bloc/app_store_bloc.dart';
import 'package:tejara_store/main/app_store_module/bloc/app_store_event.dart';
import 'package:tejara_store/main/app_store_module/bloc/app_store_state.dart';
import 'package:tejara_store/main/app_store_module/widget/app_store_update_presentation.dart';

@RoutePage()
class AppStoreUpdateContainer extends HookWidget {
  const AppStoreUpdateContainer({super.key});

  @override
  Widget build(BuildContext context) {
    updateApplication() {
      context.read<AppStoreBloc>().add(const AppStoreEventUpdateApplication());
    }

    checkForUpdates() {
      context.read<AppStoreBloc>().add(const AppStoreEventCheckForUpdates());
    }

    useEffect(() {
      checkForUpdates();
      return null;
    }, []);

    return BlocBuilder<AppStoreBloc, AppStoreState>(
      builder: (context, state) {
        if (state is AppStoreStateUpdateAvailable) {
          final String? installedVersion = state.installedVersion;
          final String? appStoreVersion = state.appStoreVersion;
          return AppStoreUpdatePresentation(
            installedVersion: installedVersion,
            appStoreVersion: appStoreVersion,
            updateApplication: updateApplication,
          );
        } else {
          return const AutoRouter();
        }
      },
    );
  }
}
