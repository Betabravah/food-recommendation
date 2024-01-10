import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';
import '../entities/auth_entity.dart';
import '../entities/login_entity.dart';
import '../entities/signup_entity.dart';

abstract class AuthRepository {
  Future<Either<Failure, AuthenticationEntity>> login(
      LoginEntity loginRequestEntity);
  Future<Either<Failure, SignupEntity>> signup(
      SignupEntity signUpEntity);

  Future<Either<Failure, void>> logout(String token);
  Future<Either<Failure, String>> getToken();
}
