import 'package:customer_laundry_app/core/connection/network_info.dart';
import 'package:customer_laundry_app/core/errors/exceptions.dart';
import 'package:customer_laundry_app/core/errors/failure.dart';
import 'package:customer_laundry_app/features/auth/data/datasources/auth_remote_data_source.dart';
import 'package:customer_laundry_app/features/auth/data/models/auth_model.dart';
import 'package:customer_laundry_app/features/auth/domain/repositories/auth_repository.dart';
import 'package:dartz/dartz.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource authRemoteDataSource;
  final NetworkInfo networkInfo;

  AuthRepositoryImpl({
    required this.authRemoteDataSource,
    required this.networkInfo,
  });

  @override
  Future<Either<Failure, bool>> register(AuthModel model) async {
    if (await networkInfo.isConnected!) {
      try {
        final remoteRegister = await authRemoteDataSource.register(model);
        return Right(remoteRegister);
      } on ServerException {
        return Left(ServerFailure(errorMessage: 'This is server Failure'));
      }
    } else {
      return Left(ServerFailure(errorMessage: 'No internet connection'));
    }
  }
}
