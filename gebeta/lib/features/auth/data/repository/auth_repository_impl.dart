import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';
import '../../../../core/network/network_info.dart';
import '../../domain/entities/auth_entity.dart';
import '../../domain/entities/authentitcation_entity.dart';
import '../../domain/repository/auth_repository.dart';
import '../datasource/local/local_datasource.dart';
import '../datasource/remote/remote_datasource.dart';
import '../models/auth_model.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource remoteDataSource;
  final AuthLocalDataSource localDataSource;
  final NetworkInfo networkInfo;

  AuthRepositoryImpl({
    required this.remoteDataSource,
    required this.localDataSource,
    required this.networkInfo,
  });

  @override
  Future<Either<Failure, AuthenticationEntity>> login(
      AuthEntity loginEntity) async {
    AuthModel loginModel = AuthModel(
      username: loginEntity.username,
      password: loginEntity.password,
    );

    if (await networkInfo.isConnected) {
      try {
        AuthenticationEntity remoteLogin =
            await remoteDataSource.login(loginModel);
        AuthModel user = AuthModel(
          username: remoteLogin.user.username,
          password: remoteLogin.user.password,
        );

        localDataSource.cacheToken(remoteLogin.token);
        localDataSource.cacheLoggedInUser(user);
        return Right(remoteLogin);
      } catch (e) {
        return Left(ServerFailure());
      }
    } else {
      return Left(NetworkFailure());
    }
  }

  @override
  Future<Either<Failure, String>> getToken() async {
    try {
      String token = await localDataSource.getToken();
      return Right(token);
    } catch (e) {
      return Left(CacheFailure());
    }
  }

  @override
  Future<Either<Failure, void>> logout(String token) async {
    try {
      await localDataSource.removeToken();
      await localDataSource.deleteLoggedInUser();
      return const Right(null);
    } catch (e) {
      return Left(CacheFailure());
    }
  }

  @override
  Future<Either<Failure, AuthEntity>> signup(AuthEntity signUpEntity) async {
    if (await networkInfo.isConnected) {
      try {
        AuthModel signupModel = AuthModel(
          username: signUpEntity.username,
          password: signUpEntity.password,
        );

        AuthModel user = await remoteDataSource.signup(signupModel);

        return Right(user);
      } catch (e) {
        return Left(ServerFailure());
      }
    } else {
      return Left(NetworkFailure());
    }
  }
}
