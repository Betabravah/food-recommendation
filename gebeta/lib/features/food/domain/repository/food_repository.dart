import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';
import '../entities/food.dart';

abstract class FoodRepository {
  Future<Either<Failure, Food>> getFood(String id);
  Future<Either<Failure, List<Food>>> getFoods();

  Future<Either<Failure, List<Food>>> filterFoods(String query);
}
