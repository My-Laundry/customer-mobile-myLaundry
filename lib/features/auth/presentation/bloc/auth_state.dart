part of 'auth_bloc.dart';

abstract class AuthState extends Equatable {
  const AuthState();

  @override
  List<Object?> get props => [];
}

class AuthInitial extends AuthState {}

class RegisterLoading extends AuthState {}

class RegisterSuccess extends AuthState {}

class RegisterFailure extends AuthState {
  final String error;

  const RegisterFailure({
    required this.error,
  });

  @override
  List<Object?> get props => [error];
}

class LoginLoading extends AuthState {}

class LoginSuccess extends AuthState {}

class LoginFailure extends AuthState {
  final String error;

  const LoginFailure({
    required this.error,
  });

  @override
  List<Object?> get props => [error];
}

class PasswordVisibilityToggled extends AuthState {
  final bool isPasswordHide;

  const PasswordVisibilityToggled({required this.isPasswordHide});

  @override
  List<Object> get props => [isPasswordHide];
}
