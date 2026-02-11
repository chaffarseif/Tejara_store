import 'package:flutter/material.dart';
import 'authentication_errors.dart';

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
            'Un compte existe déjà avec cette adresse e-mail. Si vous avez oublié votre mot de passe, veuillez cliquer sur "Mot de passe oublié".',
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

@immutable
class AuthenticationErrorEmailNotConfirmed extends AuthenticationError {
  const AuthenticationErrorEmailNotConfirmed()
    : super(
        errorText:
            'Votre adresse e-mail n’a pas encore été confirmée. Veuillez vérifier votre boîte mail.',
      );
}
