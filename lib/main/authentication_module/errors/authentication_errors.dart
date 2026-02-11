import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import 'login_errors.dart';
import 'signup_errors.dart';

@immutable
abstract class AuthenticationError extends Equatable implements Exception {
  /// Mapping basé sur les messages Supabase
  static const Map<String, AuthenticationError> authenticationErrorMapping = {
    // Signup
    'password': AuthenticationErrorSignupWeakPassword(),
    'already registered': AuthenticationErrorSignupEmailAlreadyInUse(),
    'invalid email': AuthenticationErrorSignupInvalidEmail(),
    'email not confirmed': AuthenticationErrorEmailNotConfirmed(),

    // Login
    'invalid login credentials': AuthenticationErrorLoginWrongPassword(),
    'user not found': AuthenticationErrorLoginUserNotFound(),

    // Sécurité / session
    'jwt expired': AuthenticationErrorUserTokenExpired(),
    'permission denied': AuthenticationErrorWrongPermissions(),
  };

  final String errorText;

  const AuthenticationError({required this.errorText});

  factory AuthenticationError.fromSupabase(AuthException exception) {
    final message = exception.message.toLowerCase();

    for (final entry in authenticationErrorMapping.entries) {
      if (message.contains(entry.key)) {
        return entry.value;
      }
    }

    return const AuthErrorUnknown();
  }

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
