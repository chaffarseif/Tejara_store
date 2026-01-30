import 'package:flutter/material.dart';
import 'package:tejara_store/main/authentication_module/errors/authentication_errors.dart';

@immutable
class AuthenticationErrorSignupWeakPassword extends AuthenticationError {
  const AuthenticationErrorSignupWeakPassword()
    : super(
        errorText:
            'Le mot de passe doit contenir au moins 8 caractères. Veuillez choisir un mot de passe plus long pour assurer la sécurité de votre compte.',
      );
}

@immutable
class AuthenticationErrorSignupEmailAlreadyInUse extends AuthenticationError {
  const AuthenticationErrorSignupEmailAlreadyInUse()
    : super(
        errorText:
            'Un compte existe déjà avec cette adresse e-mail. Si vous avez oublié votre mot de passe, veuillez cliquer sur "Mot de passe oublié" pour suivre la procédure de récupération.',
      );
}

@immutable
class AuthenticationErrorAccountExistsWithDifferentCredential
    extends AuthenticationError {
  const AuthenticationErrorAccountExistsWithDifferentCredential()
    : super(
        errorText:
            'Un compte existe déjà avec cette adresse e-mail mais avec un autre service de connexion. Si vous avez oublié votre mot de passe, veuillez cliquer sur "Mot de passe oublié" pour suivre la procédure de récupération.',
      );
}

@immutable
class AuthenticationErrorSignupInvalidEmail extends AuthenticationError {
  const AuthenticationErrorSignupInvalidEmail()
    : super(
        errorText:
            'L\'adresse e-mail que vous avez saisie est invalide. Merci de vérifier votre adresse e-mail.',
      );
}
