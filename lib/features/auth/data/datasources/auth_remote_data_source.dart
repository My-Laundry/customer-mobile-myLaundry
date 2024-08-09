import 'package:customer_laundry_app/core/errors/exceptions.dart';
import 'package:dio/dio.dart';

import '../models/auth_model.dart';

abstract class AuthRemoteDataSource {
  Future<bool> register(
    AuthModel model,
  );
}

class AuthRemoteDataSourceImpl extends AuthRemoteDataSource {
  Dio dio = Dio();

  AuthRemoteDataSourceImpl({required this.dio});
  @override
  Future<bool> register(AuthModel model) async {
    try {
      final response =
          // await dio.post('$baseUrl/register', data: model.toJson());
          await dio.post('https://bcf6-110-138-0-110.ngrok-free.app/api/signup',
              data: model.toJson());

      print('Response status code: ${response.statusCode}');
      print('Response data: ${response.data}');

      if (response.statusCode == 200) {
        // var responseData = AuthModel.fromJson(response.data);
        print('Registration successful: ${response.data}');
        return true;
      } else {
        print('Registration failed with status code: ${response.statusCode}');

        return false;
      }
    } catch (e) {
      throw ServerException();
    }
  }
}
