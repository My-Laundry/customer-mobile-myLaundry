import 'dart:convert';
import 'package:customer_laundry_app/features/auth/domain/entities/auth_entity.dart';

class AuthModel extends AuthEntity {
  const AuthModel({
    super.username,
    required super.email,
    required super.password,
  });

  factory AuthModel.fromRawJson(String str) =>
      AuthModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory AuthModel.fromJson(Map<String, dynamic> json) => AuthModel(
        username: json["username"],
        email: json["email"],
        password: json["password"],
      );

  Map<String, dynamic> toJson() => {
        "username": username,
        "email": email,
        "password": password,
      };

  factory AuthModel.fromEntity(AuthEntity entity) {
    return AuthModel(
      username: entity.username,
      email: entity.email,
      password: entity.password,
    );
  }
}
