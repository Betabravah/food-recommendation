import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';
import '../entities/user.dart';

abstract class UserRepository {
  Future<Either<Failure, User>> getUser(String token);
  Future<Either<Failure, User>> updateUser(User user);
  Future<Either<Failure, User>> deleteUser(String token);
}