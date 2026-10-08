part of 'auth_bloc_bloc.dart';

sealed class AuthBlocEvent extends Equatable {
  const AuthBlocEvent();
  @override
  List<Object> get props => [];
}

class AuthRegister extends AuthBlocEvent {
  final String email;
  final String password;
  final String name;

  const AuthRegister({
    required this.email,
    required this.password,
    required this.name,
  });

  @override
  List<Object> get props => [email, password, name];
}

class AuthLogin extends AuthBlocEvent {
  final String email;
  final String password;
  final String name;

  const AuthLogin({
    required this.email,
    required this.password,
    required this.name,
  });

  @override
  List<Object> get props => [email, password, name];
}

class AuthLogout extends AuthBlocEvent {}

class AuthCheckAuthStatus extends AuthBlocEvent {}