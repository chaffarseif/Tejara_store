import 'package:equatable/equatable.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class AuthenticationSignInProviderUser extends Equatable {
  final String? email;
  final String? displayName;

  const AuthenticationSignInProviderUser({this.email, this.displayName});

  /// Crée depuis un Supabase User
  factory AuthenticationSignInProviderUser.fromSupabaseUser(User user) {
    return AuthenticationSignInProviderUser(
      email: user.email,
      displayName: user.userMetadata?['full_name'] ?? user.email,
    );
  }

  /// Crée une map par provider (identities Supabase)
  static Map<
    AuthenticationSignInProviderUserEnum,
    AuthenticationSignInProviderUser
  >
  fromSupabaseUserIdentities(User user) {
    final Map<
      AuthenticationSignInProviderUserEnum,
      AuthenticationSignInProviderUser
    >
    result = {};

    for (final identity in user.identities ?? []) {
      final providerEnum = AuthenticationSignInProviderUserEnum.getByProviderId(
        identity.provider,
      );
      if (providerEnum != null) {
        result[providerEnum] = AuthenticationSignInProviderUser(
          email: user.email,
          displayName: user.userMetadata?['full_name'] ?? user.email,
        );
      }
    }

    // Fallback si pas de provider spécifique
    if (result.isEmpty) {
      result[AuthenticationSignInProviderUserEnum.emailPassword] =
          AuthenticationSignInProviderUser.fromSupabaseUser(user);
    }

    return result;
  }

  @override
  List<Object?> get props => [email, displayName];
}

enum AuthenticationSignInProviderUserEnum {
  emailPassword('email'),
  google('google'),
  facebook('facebook'); // <-- ajouté Facebook

  final String providerId;
  const AuthenticationSignInProviderUserEnum(this.providerId);

  static AuthenticationSignInProviderUserEnum? getByProviderId(
    String providerId,
  ) {
    return AuthenticationSignInProviderUserEnum.values.firstWhere(
      (e) => e.providerId == providerId,
      orElse: () => AuthenticationSignInProviderUserEnum.emailPassword,
    );
  }
}
