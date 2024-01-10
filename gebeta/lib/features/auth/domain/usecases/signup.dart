import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../../../../core/error/failure.dart';
import '../../../../core/usecase/usecase.dart';
import '../entities/signup_entity.dart';
import '../repository/auth_repository.dart';

class Signup implements UseCase<SignupEntity, SignupParams> {
  final AuthRepository repository;

  Signup(this.repository);

  @override
  Future<Either<Failure, SignupEntity>> call(SignupParams params) async {
    return await repository.signup(
      params.signupEntity,
    );
  }
}

class SignupParams extends Equatable {
  final SignupEntity signupEntity;

  const SignupParams({required this.signupEntity});

  @override
  List<Object?> get props => [signupEntity];
}

