import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';
import '../entities/auth_entity.dart';
import '../entities/authentitcation_entity.dart';

abstract class AuthRepository {
  Future<Either<Failure, AuthenticationEntity>> login(
      AuthEntity authEntity);
  Future<Either<Failure, AuthEntity>> signup(AuthEntity authEntity);

  Future<Either<Failure, void>> logout(String token);
  Future<Either<Failure, String>> getToken();
}
