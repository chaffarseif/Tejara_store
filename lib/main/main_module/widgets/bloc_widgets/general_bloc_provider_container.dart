import 'package:auto_route/auto_route.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:tejara_store/main/authentication_module/bloc/authentication_bloc.dart';
import 'package:tejara_store/main/authentication_module/service/authentication/authentication_service.dart';

import 'package:tejara_store/main/authentication_module/service/onBoarding_service.dart';

@RoutePage()
class GeneralBlocProviderContainer extends StatelessWidget {
  const GeneralBlocProviderContainer({super.key});

  @override
  Widget build(BuildContext context) {
    print('--- [GeneralBlocProvider] Widget Built ---');
    return FutureBuilder<SharedPreferences>(
      future: SharedPreferences.getInstance(),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          print(
            '--- [GeneralBlocProvider] Error Initializing SharedPreferences: ${snapshot.error} ---',
          );
          return Scaffold(
            body: Center(child: Text('Error: ${snapshot.error}')),
          );
        }
        if (snapshot.connectionState == ConnectionState.waiting) {
          print('--- [GeneralBlocProvider] Waiting for SharedPreferences ---');
          return const Scaffold(
            body: Center(child: CircularProgressIndicator()),
          );
        }
        if (snapshot.hasData) {
          print('--- [GeneralBlocProvider] SharedPreferences Initialized ---');
          return MultiBlocProvider(
            providers: [
              BlocProvider<AuthenticationBloc>(
                create: (context) => AuthenticationBloc(
                  OnBoardingService(sharedPreferences: snapshot.data!),
                  AuthenticationService(
                    authentication: FirebaseAuth.instance,
                    firestore: FirebaseFirestore.instance,
                  ),
                )..add(const AuthenticationEventCheckStatus()),
              ),
            ],
            child: const AutoRouter(),
          );
        }
        print('--- [GeneralBlocProvider] Unknown FutureBuilder State ---');
        return const Scaffold(body: Center(child: CircularProgressIndicator()));
      },
    );
  }
}
