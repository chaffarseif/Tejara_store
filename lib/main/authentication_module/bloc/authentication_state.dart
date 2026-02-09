part of 'authentication_bloc.dart';

abstract class AuthenticationState extends Equatable {
  const AuthenticationState();
}

@immutable
class AuthenticationStateLoggedOut extends AuthenticationState {
  late final RouterPath routerPath;

  AuthenticationStateLoggedOut({RouterPath? routerPath}) {
    this.routerPath = routerPath ?? loginRouteContainer;
  }
  @override
  List<Object?> get props => [routerPath];
}

@immutable
class AuthenticationStateLoggedIn extends AuthenticationState {
  final AuthenticationUser user;

  const AuthenticationStateLoggedIn({required this.user});
  static AuthenticationStateLoggedIn fromState(
    AuthenticationStateLoggedIn authenticationStateLoggedIn, {
    Map<String, dynamic> updateMap = const {},
  }) {
    return AuthenticationStateLoggedIn(
      user: updateMap['user'] ?? authenticationStateLoggedIn.user,
    );
  }

  @override
  List<Object?> get props => [user];
}
