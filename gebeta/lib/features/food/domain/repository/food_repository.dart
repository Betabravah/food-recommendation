import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../../../../core/error/failure.dart';
import '../entities/food.dart';

abstract class FoodRepository extends Equatable {
  Future<Either<Failure, Food>> getFood(String id);
  Future<Either<Failure, List<Food>>> getFoods();
}
