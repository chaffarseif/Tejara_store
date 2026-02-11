import 'package:flutter/material.dart';
import 'authentication_errors.dart';

@immutable
class AuthenticationErrorLoginUserNotFound extends AuthenticationError {
  const AuthenticationErrorLoginUserNotFound()
    : super(
        errorText:
            'Aucun utilisateur trouvé avec ces coordonnées. Veuillez vérifier vos informations et réessayer.',
      );
}

@immutable
class AuthenticationErrorLoginWrongPassword extends AuthenticationError {
  const AuthenticationErrorLoginWrongPassword()
    : super(
        errorText:
            'Mot de passe incorrect. Veuillez vérifier et réessayer. Utilisez "Mot de passe oublié" si nécessaire.',
      );
}

@immutable
class AuthenticationErrorUserTokenExpired extends AuthenticationError {
  const AuthenticationErrorUserTokenExpired()
    : super(errorText: 'Votre session a expiré. Veuillez vous reconnecter.');
}

@immutable
class AuthenticationErrorWrongPermissions extends AuthenticationError {
  const AuthenticationErrorWrongPermissions()
    : super(
        errorText:
            'Vous ne disposez pas des autorisations requises pour effectuer cette action.',
      );
}
