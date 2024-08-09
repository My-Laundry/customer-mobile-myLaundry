import 'package:customer_laundry_app/core/errors/failure.dart';
import 'package:customer_laundry_app/features/auth/data/models/auth_model.dart';
import 'package:customer_laundry_app/features/auth/domain/repositories/auth_repository.dart';
import 'package:dartz/dartz.dart';

class AuthUsecase {
  final AuthRepository repository;

  AuthUsecase({required this.repository});

  Future<Either<Failure, bool>> callRegister({required AuthModel authModel}) async {
    return await repository.register(authModel);
  }
}
