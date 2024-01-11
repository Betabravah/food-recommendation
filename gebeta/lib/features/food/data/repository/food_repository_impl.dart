import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';
import '../../../../core/network/network_info.dart';
import '../../domain/entities/food.dart';
import '../../domain/repository/food_repository.dart';
import '../datasources/local/local_datasource.dart';
import '../datasources/remote/remote_datasoucre.dart';

class FoodRepositoryImpl implements FoodRepository {
  final RemoteDataSource remoteDataSource;
  final LocalDataSource localDataSource;
  final NetworkInfo networkInfo;

  const FoodRepositoryImpl({
    required this.remoteDataSource,
    required this.localDataSource,
    required this.networkInfo,
  });

  @override
  Future<Either<Failure, Food>> getFood(String id) async {
    if (await networkInfo.isConnected) {
      try {
        final remoteFood = await remoteDataSource.getFood(id);
        localDataSource.cacheFood(remoteFood);
        return Right(remoteFood);
      } catch (e) {
        return Left(ServerFailure());
      }
    } else {
      try {
        final localFood = await localDataSource.getFood(id);
        return Right(localFood);
      } catch (e) {
        return Left(CacheFailure());
      }
    }
  }

  @override
  Future<Either<Failure, List<Food>>> getFoods() async {
    if (await networkInfo.isConnected) {
      try {
        final remoteFoods = await remoteDataSource.getFoods();
        localDataSource.cacheFoods(remoteFoods);
        return Right(remoteFoods);
      } catch (e) {
        return Left(ServerFailure());
      }
    } else {
      try {
        final localFoods = await localDataSource.getFoods();
        return Right(localFoods);
      } catch (e) {
        return Left(CacheFailure());
      }
    }
  }

}
