import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:karma_design_system_mobile/providers/router_providers/models/router_path.model.dart';
import 'package:tejara_store/core/routing/routers/app_router.dart';
import 'package:tejara_store/main/authentication_module/errors/authentication_errors.dart';
import 'package:tejara_store/main/authentication_module/models/authentication_user.dart';
import 'package:tejara_store/main/authentication_module/models/signup_user.dart';
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
    on<AuthenticationEventSignupByEmailAndPassword>((event, emit) async {
      final routerPath = (state as AuthenticationStateLoggedOut).routerPath;

      emit(const AuthenticationStateIsLoading());
      try {
        final user = await authenticationService.signupWithEmailAndPassword(
          event.signupModel,
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
      // 1️⃣ État de chargement (Splash)
      emit(const AuthenticationStateIsLoading());

      // 2️⃣ Délai minimum pour voir le Splash screen (ex: 2 secondes)
      await Future.delayed(const Duration(seconds: 3));

      // 3️⃣ Vérifier si l'onboarding est déjà vu
      final onBoardingSeen = await _onBoardingService.onBoardingSeen();

      // 4️⃣ Vérifier si l'utilisateur est connecté
      final user = await authenticationService.getAuthenticatedUser();

      // 4️⃣ Émettre l'état final
      if (user != null) {
        emit(
          AuthenticationStateLoggedIn(
            user: user,
            onBoardingSeen: onBoardingSeen,
          ),
        );
      } else {
        emit(
          AuthenticationStateLoggedOut(
            routerPath: onBoardingSeen
                ? loginRouteContainer
                : onBoardingRouteContainer,
          ),
        );
      }
    });
  }
}
