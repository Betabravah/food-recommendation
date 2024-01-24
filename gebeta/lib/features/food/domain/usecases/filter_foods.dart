import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../../../../core/error/failure.dart';
import '../../../../core/usecase/usecase.dart';
import '../entities/food.dart';
import '../repository/food_repository.dart';

class FilterFoods implements UseCase<List<Food>, FilterFoodsParams> {
  final FoodRepository repository;

  const FilterFoods(this.repository);

  @override
  Future<Either<Failure, List<Food>>> call(FilterFoodsParams params) async {
    return await repository.filterFoods(params.query);
  }
}

class FilterFoodsParams extends Equatable {
  final String query;

  const FilterFoodsParams(this.query);

  @override
  List<Object?> get props => [query];
}
