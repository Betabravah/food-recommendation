import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../../../../core/error/failure.dart';
import '../../../../core/usecase/usecase.dart';
import '../entities/auth_entity.dart';
import '../entities/authentitcation_entity.dart';
import '../repository/auth_repository.dart';

class Login implements UseCase<AuthenticationEntity, LoginParams> {
  final AuthRepository repository;

  Login( {required this.repository});

  @override
  Future<Either<Failure, AuthenticationEntity>> call(LoginParams params) async {
    return await repository.login(
      params.loginEntity,
    );
  }
}

class LoginParams extends Equatable {
  final AuthEntity loginEntity;

  const LoginParams({required this.loginEntity});

  @override
  List<Object?> get props => [loginEntity];
}
