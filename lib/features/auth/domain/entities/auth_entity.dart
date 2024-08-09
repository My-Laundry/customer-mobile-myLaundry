import 'package:equatable/equatable.dart';

class AuthEntity extends Equatable {
  final String? username;
  final String email;
  final String password;

  const AuthEntity({
    this.username,
    required this.email,
    required this.password,
  });

  @override
  List<Object?> get props => [
        username,
        email,
        password,
      ];
}
