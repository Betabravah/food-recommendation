import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';
import '../../../../core/usecase/usecase.dart';
import '../entities/food.dart';
import '../repository/food_repository.dart';

class GetFoods implements UseCase<List<Food>, NoParams> {
  final FoodRepository repository;

  const GetFoods(this.repository);

  @override
  Future<Either<Failure, List<Food>>> call(NoParams params) async {
    return await repository.getFoods();
  }
}
