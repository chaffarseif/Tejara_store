import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:karma_design_system_mobile/providers/router_providers/models/router_path.model.dart';
import 'package:tejara_store/core/routing/routers/app_router.dart';
import 'package:tejara_store/main/authentication_module/errors/authentication_errors.dart';
import 'package:tejara_store/main/authentication_module/models/authentication_user.dart';
import 'package:tejara_store/main/authentication_module/service/authentication/authentication_service.dart';
import 'package:tejara_store/main/authentication_module/service/onBoarding_service.dart';

part 'authentication_event.dart';
part 'authentication_state.dart';

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState?> {
  final OnBoardingService _onBoardingService;
  final AuthenticationService authenticationService;
  AuthenticationBloc(this._onBoardingService, this.authenticationService)
    : super(null) {
    on<AuthenticationEventSetOnBoardingSeen>((event, emit) async {
      final user = (state as AuthenticationStateLoggedIn).user;
      try {
        await _onBoardingService.setOnBoardingSeen();
        emit(
          AuthenticationStateLoggedIn(
            user: user,
            onBoardingSeen: await _onBoardingService.onBoardingSeen(),
          ),
        );
      } on AuthenticationError catch (authenticationError) {
        emit(
          AuthenticationStateLoggedIn(
            user: user,
            onBoardingSeen: await _onBoardingService.onBoardingSeen(),
            authenticationError: authenticationError,
          ),
        );
      }
    });
    on<AuthenticationEventLoginByEmailAndPassword>((event, emit) async {
      final routerPath = (state as AuthenticationStateLoggedOut).routerPath;

      emit(const AuthenticationStateIsLoading());
      final email = event.email;
      final password = event.password;
      try {
        final user = await authenticationService.loginWithEmailAndPassword(
          email,
          password,
        );
        emit(AuthenticationStateLoggedIn(user: user));
      } on AuthenticationError catch (authenticationError) {
        emit(
          AuthenticationStateLoggedOut(
            routerPath: routerPath,
            authenticationError: authenticationError,
          ),
        );
      }
    });
    on<AuthenticationEventCheckStatus>((event, emit) async {
      final onBoardingSeen = await _onBoardingService.onBoardingSeen();
      final user = await authenticationService.getAuthenticatedUser();

      if (user != null) {
        emit(
          AuthenticationStateLoggedIn(
            user: user,
            onBoardingSeen: onBoardingSeen,
          ),
        );
      } else {
        print('--- [Bloc] User is Logged Out ---');
        if (!onBoardingSeen) {
          print(
            '--- [Bloc] Onboarding NOT seen, redirecting to Onboarding ---',
          );
          emit(
            AuthenticationStateLoggedOut(routerPath: onBoardingRouteContainer),
          );
        } else {
          print('--- [Bloc] Onboarding seen, redirecting to Login ---');
          emit(AuthenticationStateLoggedOut(routerPath: loginRouteContainer));
        }
      }
    });
  }
}
