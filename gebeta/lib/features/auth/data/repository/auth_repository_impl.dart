import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';
import '../../../../core/network/network_info.dart';
import '../../domain/entities/auth_entity.dart';
import '../../domain/entities/login_entity.dart';
import '../../domain/entities/signup_entity.dart';
import '../../domain/repository/auth_repository.dart';
import '../datasource/local/local_datasource.dart';
import '../datasource/remote/remote_datasource.dart';
import '../models/login_model.dart';
import '../models/signup_model.dart';

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
      LoginEntity loginEntity) async {
    LoginModel loginModel = LoginModel(
      email: loginEntity.email,
      password: loginEntity.password,
    );

    if (await networkInfo.isConnected) {
      try {
        AuthenticationEntity remoteLogin =
            await remoteDataSource.login(loginModel);
        SignupModel user = SignupModel(
          email: remoteLogin.user.email,
          firstName: remoteLogin.user.firstName,
          lastName: remoteLogin.user.lastName,
          password: remoteLogin.user.password,
          height: remoteLogin.user.height,
          weight: remoteLogin.user.weight,
          upperArmLength: remoteLogin.user.upperArmLength,
          armCircumference: remoteLogin.user.armCircumference,
          hipCircumference: remoteLogin.user.hipCircumference,
          waistCircumference: remoteLogin.user.waistCircumference,
          upperLegLength: remoteLogin.user.upperLegLength,
          systolic: remoteLogin.user.systolic,
          diastolic: remoteLogin.user.diastolic,
          pulse: remoteLogin.user.pulse,
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
  Future<Either<Failure, SignupEntity>> signup(
      SignupEntity signUpEntity) async {
    if (await networkInfo.isConnected) {
      try {
        SignupModel signupModel = SignupModel(
          email: signUpEntity.email,
          password: signUpEntity.password,
          firstName: signUpEntity.firstName,
          lastName: signUpEntity.lastName,
          height: signUpEntity.height,
          weight: signUpEntity.weight,
          upperLegLength: signUpEntity.upperLegLength,
          upperArmLength: signUpEntity.upperArmLength,
          armCircumference: signUpEntity.armCircumference,
          waistCircumference: signUpEntity.waistCircumference,
          hipCircumference: signUpEntity.hipCircumference,
          systolic: signUpEntity.systolic,
          diastolic: signUpEntity.diastolic,
          pulse: signUpEntity.pulse,
        );

        SignupModel user = await remoteDataSource.signup(signupModel);

        return Right(user);
      } catch (e) {
        return Left(ServerFailure());
      }
    } else {
      return Left(NetworkFailure());
    }
  }
}
