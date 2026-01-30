import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:tejara_store/main/authentication_module/errors/login_errors.dart';
import 'package:tejara_store/main/authentication_module/errors/signup_errors.dart';

@immutable
abstract class AuthenticationError extends Equatable implements Exception {
  static const Map<String, AuthenticationError> authenticationErrorMapping = {
    'weak-password': AuthenticationErrorSignupWeakPassword(),
    'email-already-in-use': AuthenticationErrorSignupEmailAlreadyInUse(),
    'account-exists-with-different-credential':
        AuthenticationErrorAccountExistsWithDifferentCredential(),
    'invalid-email': AuthenticationErrorSignupInvalidEmail(),
    'user-not-found': AuthenticationErrorLoginUserNotFound(),
    'wrong-password': AuthenticationErrorLoginWrongPassword(),
    'user-disabled': AuthenticationErrorLoginUserDisabled(),
    'requires-recent-login': AuthenticationErrorRequiresRecentLogin(),
    'user-token-expired': AuthenticationErrorUserTokenExpired(),
  };

  final String errorText;

  const AuthenticationError({required this.errorText});

  factory AuthenticationError.fromFirebase(FirebaseAuthException exception) =>
      authenticationErrorMapping[exception.code.toLowerCase().trim()] ??
      const AuthErrorUnknown();

  @override
  List<Object?> get props => [errorText];
}

@immutable
class AuthErrorUnknown extends AuthenticationError {
  const AuthErrorUnknown()
    : super(
        errorText:
            'Une erreur s\'est produite lors de votre action. Merci de réessayer ultérieurement.',
      );
}
