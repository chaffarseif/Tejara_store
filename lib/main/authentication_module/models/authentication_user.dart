import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:tejara_store/main/authentication_module/models/authentication_sign_in_provider.dart';

class AuthenticationUser extends Equatable {
  late final String uid;
  late final String? email;
  late final bool isEmailVerified;
  late final Map<
    AuthenticationSignInProviderUserEnum,
    AuthenticationSignInProviderUser
  >
  authenticationSignInProviderUsersMap;
  late final bool isFirstTime;

  AuthenticationUser.fromFirebaseUser(User user) {
    uid = user.uid;
    email = user.email;
    isEmailVerified = user.emailVerified;
    authenticationSignInProviderUsersMap =
        AuthenticationSignInProviderUser.fromFirebaseUsersInfo(
          user.providerData,
        );
    isFirstTime = true;
  }

  @override
  List<Object?> get props => [
    uid,
    email,
    isEmailVerified,
    authenticationSignInProviderUsersMap,
    isFirstTime,
  ];
}
