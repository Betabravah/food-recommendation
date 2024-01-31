import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../../../../core/error/failure.dart';
import '../../../../core/usecase/usecase.dart';
import '../repository/auth_repository.dart';

class Logout extends UseCase<void, LogoutParams> {
  final AuthRepository repository;

  Logout(this.repository, {required authRepository});

  @override
  Future<Either<Failure, void>> call(LogoutParams params) async {
    return await repository.logout(params.token);
  }
}

class LogoutParams extends Equatable {
  final String token;

  const LogoutParams({required this.token});

  @override
  List<Object?> get props => [token];
}