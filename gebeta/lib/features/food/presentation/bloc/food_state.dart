import 'package:equatable/equatable.dart';

import '../../domain/entities/food.dart';

sealed class FoodState extends Equatable {
  const FoodState();

  @override
  List<Object> get props => [];
}

final class FoodInitialState extends FoodState {}

final class FoodLoadingState extends FoodState {}

final class SingleFoodLoadedState extends FoodState {
  final Food food;

  const SingleFoodLoadedState(this.food);

  @override
  List<Object> get props => [food];
}

final class AllFoodsLoadedState extends FoodState {
  final List<Food> foods;

  const AllFoodsLoadedState(this.foods);

  @override
  List<Object> get props => [foods];
}

final class AllFoodsFilteredState extends FoodState {
  final List<Food> foods;

  const AllFoodsFilteredState(this.foods);

  @override
  List<Object> get props => [foods];
}


final class FoodErrorState extends FoodState {
  final String message;

  const FoodErrorState(this.message);

  @override
  List<Object> get props => [message];
}