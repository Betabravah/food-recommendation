import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../../../../core/error/failure.dart';
import '../../../../core/usecase/usecase.dart';
import '../entities/auth_entity.dart';
import '../repository/auth_repository.dart';

class Signup implements UseCase<AuthEntity, SignupParams> {
  final AuthRepository repository;

  Signup(this.repository);

  @override
  Future<Either<Failure, AuthEntity>> call(SignupParams params) async {
    return await repository.signup(
      params.signupEntity,
    );
  }
}

class SignupParams extends Equatable {
  final AuthEntity signupEntity;

  const SignupParams({required this.signupEntity});

  @override
  List<Object?> get props => [signupEntity];
}
