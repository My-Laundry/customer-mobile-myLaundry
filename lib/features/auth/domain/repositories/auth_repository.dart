import 'package:customer_laundry_app/core/errors/failure.dart';
import 'package:customer_laundry_app/features/auth/data/models/auth_model.dart';
import 'package:dartz/dartz.dart';

abstract class AuthRepository {
  Future<Either<Failure, bool>> register(
    AuthModel data,
  );
}
