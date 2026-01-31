import 'package:tejara_store/core/routing/bloc/router_bloc.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:karma_design_system_mobile/karma_design_system_mobile.dart';
import 'package:tejara_store/main/app_life_cycle_module/bloc/app_life_cycle_bloc.dart';
import 'package:tejara_store/main/app_store_module/bloc/app_store_bloc.dart';
import 'package:tejara_store/main/internet_checker_module/bloc/internet_checker_bloc.dart';
import 'package:tejara_store/main/theme_selector_module/bloc/theme_selector_module_bloc.dart';
import 'package:tejara_store/main/theme_selector_module/service/theme_selector_service.dart';

@RoutePage()
class CoreBlocProviderContainer extends StatelessWidget {
  const CoreBlocProviderContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<RouterBloc>(
          create: (_) => RouterBloc(RouterProviderFactory.make()),
        ),
        BlocProvider<AppLifeCycleBloc>(create: (_) => AppLifeCycleBloc()),
        BlocProvider<InternetCheckerBloc>(
          create: (context) => InternetCheckerBloc(
            InternetCheckerProviderFactory.make(),
            context.read<AppLifeCycleBloc>(),
          ),
        ),
        BlocProvider<AppStoreBloc>(
          create: (_) => AppStoreBloc(AppStoreProviderFactory.make()),
        ),
        BlocProvider<ThemeSelectorBloc>(
          create: (_) => ThemeSelectorBloc(
            ThemeSelectorService(
              localStorageProvider: LocalStorageProviderFactory.make(),
            ),
          ),
        ),
      ],
      child: const AutoRouter(),
    );
  }
}
