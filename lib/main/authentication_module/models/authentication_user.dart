import 'package:equatable/equatable.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'authentication_sign_in_provider.dart';

class AuthenticationUser extends Equatable {
  final String uid;
  final String? email;
  final bool isEmailVerified;
  final Map<
    AuthenticationSignInProviderUserEnum,
    AuthenticationSignInProviderUser
  >
  authenticationSignInProviderUsersMap;
  final bool isFirstTime;

  /// Constructeur depuis Supabase User
  AuthenticationUser.fromSupabaseUser(User user)
    : uid = user.id,
      email = user.email,
      isEmailVerified = user.emailConfirmedAt != null,
      authenticationSignInProviderUsersMap =
          AuthenticationSignInProviderUser.fromSupabaseUserIdentities(user),
      isFirstTime = true;

  @override
  List<Object?> get props => [
    uid,
    email,
    isEmailVerified,
    authenticationSignInProviderUsersMap,
    isFirstTime,
  ];
}
