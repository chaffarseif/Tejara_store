import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:tejara_store/main.dart';

import 'package:tejara_store/main/authentication_module/bloc/authentication_bloc.dart';
import 'package:tejara_store/main/authentication_module/service/authentication/authentication_service.dart';

import 'package:tejara_store/main/authentication_module/service/onBoarding_service.dart';

@RoutePage()
class GeneralBlocProviderContainer extends StatelessWidget {
  const GeneralBlocProviderContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<AuthenticationBloc>(
          create: (context) => AuthenticationBloc(
            OnBoardingService(sharedPreferences: sharedPreferences),
            AuthenticationService.instance,
          )..add(const AuthenticationEventCheckStatus()),
        ),
      ],
      child: const AutoRouter(),
    );
  }
}
