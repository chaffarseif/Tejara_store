part of 'authentication_bloc.dart';

abstract class AuthenticationState extends Equatable {
  const AuthenticationState();
}

@immutable
class AuthenticationStateIsLoading extends AuthenticationState {
  const AuthenticationStateIsLoading();

  @override
  List<Object?> get props => [];
}

@immutable
class AuthenticationStateLoggedOut extends AuthenticationState {
  late final RouterPath routerPath;
  final AuthenticationError? authenticationError;

  AuthenticationStateLoggedOut({
    RouterPath? routerPath,
    this.authenticationError,
  }) {
    this.routerPath = routerPath ?? loginRouteContainer;
  }
  @override
  List<Object?> get props => [routerPath, authenticationError];
}

@immutable
class AuthenticationStateLoggedIn extends AuthenticationState {
  final AuthenticationUser user;
  final bool onBoardingSeen;
  final AuthenticationError? authenticationError;

  const AuthenticationStateLoggedIn({
    required this.user,
    this.onBoardingSeen = false,
    this.authenticationError,
  });
  static AuthenticationStateLoggedIn fromState(
    AuthenticationStateLoggedIn authenticationStateLoggedIn, {
    Map<String, dynamic> updateMap = const {},
  }) {
    return AuthenticationStateLoggedIn(
      user: updateMap['user'] ?? authenticationStateLoggedIn.user,
      onBoardingSeen:
          updateMap['onBoardingSeen'] ??
          authenticationStateLoggedIn.onBoardingSeen,
      authenticationError:
          updateMap['authenticationError'] ??
          authenticationStateLoggedIn.authenticationError,
    );
  }

  @override
  List<Object?> get props => [user];
}
