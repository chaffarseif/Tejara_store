import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthenticationSignInProviderUser extends Equatable {
  late final String? email;
  late final String? displayName;
  AuthenticationSignInProviderUser.fromFirebaseUserInfo(UserInfo userInfo) {
    email = userInfo.email;
    displayName = userInfo.displayName;
  }
  static Map<
    AuthenticationSignInProviderUserEnum,
    AuthenticationSignInProviderUser
  >
  fromFirebaseUsersInfo(List<UserInfo> userInfo) {
    final Map<
      AuthenticationSignInProviderUserEnum,
      AuthenticationSignInProviderUser
    >
    authenticationSignInProviderUsersMap = {};
    for (final info in userInfo) {
      AuthenticationSignInProviderUserEnum?
      authenticationSignInProviderUserEnum =
          AuthenticationSignInProviderUserEnum.getAuthenticationSignInProviderUserByProviderId(
            info.providerId,
          );
      if (authenticationSignInProviderUserEnum != null) {
        authenticationSignInProviderUsersMap[authenticationSignInProviderUserEnum] =
            AuthenticationSignInProviderUser.fromFirebaseUserInfo(info);
      }
    }
    return authenticationSignInProviderUsersMap;
  }

  @override
  List<Object?> get props => [email, displayName];
}

enum AuthenticationSignInProviderUserEnum {
  emailPassword('password');

  final String providerId;
  const AuthenticationSignInProviderUserEnum(this.providerId);
  static AuthenticationSignInProviderUserEnum?
  getAuthenticationSignInProviderUserByProviderId(String providerId) {
    return AuthenticationSignInProviderUserEnum.values
        .where((element) => element.providerId == providerId)
        .first;
  }
}
