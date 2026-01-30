import 'package:flutter/material.dart';
import 'package:tejara_store/main/authentication_module/errors/authentication_errors.dart';

@immutable
class AuthenticationErrorLoginUserNotFound extends AuthenticationError {
  const AuthenticationErrorLoginUserNotFound()
    : super(
        errorText:
            'Aucun utilisateur trouvé avec ces coordonnées. Veuillez vérifier vos informations et réessayer. Contactez notre service d\'assistance en cas de besoin.',
      );
}

@immutable
class AuthenticationErrorLoginWrongPassword extends AuthenticationError {
  const AuthenticationErrorLoginWrongPassword()
    : super(
        errorText:
            'Mot de passe incorrect. Veuillez vérifier et réessayer. Si vous avez oublié votre mot de passe, veuillez utiliser l\'option \'Mot de passe oublié \' pour réinitialiser votre compte.',
      );
}

@immutable
class AuthenticationErrorLoginUserDisabled extends AuthenticationError {
  const AuthenticationErrorLoginUserDisabled()
    : super(errorText: 'Votre compte a été désactivé.');
}

@immutable
class AuthenticationErrorRequiresRecentLogin extends AuthenticationError {
  const AuthenticationErrorRequiresRecentLogin()
    : super(errorText: 'Vous-devez reconnecter.');
}

@immutable
class AuthenticationErrorUserTokenExpired extends AuthenticationError {
  const AuthenticationErrorUserTokenExpired()
    : super(errorText: 'Connexion Expiré.');
}

@immutable
class AuthenticationErrorWrongPermissions extends AuthenticationError {
  const AuthenticationErrorWrongPermissions()
    : super(
        errorText:
            'Vous ne disposez pas des autorisations requises pour vous connecter.',
      );
}
