import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../../../../core/error/failure.dart';
import '../../../../core/usecase/usecase.dart';
import '../entities/food.dart';
import '../repository/food_repository.dart';

class GetFood implements UseCase<Food, GetFoodParams> {
  final FoodRepository repository;

  const GetFood(this.repository);

  @override
  Future<Either<Failure, Food>> call(GetFoodParams params) async {
    return await repository.getFood(params.id);
  }
}

class GetFoodParams extends Equatable {
  final String id;

  const GetFoodParams(this.id);

  @override
  List<Object?> get props => [id];
}
