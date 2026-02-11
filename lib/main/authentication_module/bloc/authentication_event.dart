part of 'authentication_bloc.dart';

@immutable
abstract class AuthenticationEvent extends Equatable {
  const AuthenticationEvent();
}

@immutable
class AuthenticationEventSetOnBoardingSeen extends AuthenticationEvent {
  const AuthenticationEventSetOnBoardingSeen();

  @override
  List<Object> get props => [];
}

class AuthenticationEventLoginByEmailAndPassword extends AuthenticationEvent {
  final String email;
  final String password;
  const AuthenticationEventLoginByEmailAndPassword({
    required this.email,
    required this.password,
  });
  @override
  List<Object> get props => [email, password];
}

@immutable
class AuthenticationEventSignupByEmailAndPassword extends AuthenticationEvent {
  final SignupModel signupModel;

  const AuthenticationEventSignupByEmailAndPassword({
    required this.signupModel,
  });

  @override
  List<Object?> get props => [signupModel];
}

class AuthenticationEventCheckStatus extends AuthenticationEvent {
  const AuthenticationEventCheckStatus();
  @override
  List<Object> get props => [];
}
