part of 'auth_bloc_bloc.dart';


sealed class AuthBlocState extends Equatable {
  const AuthBlocState();
  @override
  List<Object> get props => [];
}


final class AuthBlocInitial extends AuthBlocState {}


class AuthLoading extends AuthBlocState {}


class AuthAuthenticated extends AuthBlocState {
  final UserEntity user;
  const AuthAuthenticated({required this.user});
  @override
  List<Object> get props => [user];
}


class AuthUnauthenticated extends AuthBlocState {}


class AuthError extends AuthBlocState {
  final String message;
  const AuthError({required this.message});
  @override
  List<Object> get props => [message];
}