import 'package:equatable/equatable.dart';


sealed class FoodEvent extends Equatable {
  const FoodEvent();

  @override
  List<Object?> get props => [];
}

final class LoadAllFoodsEvent extends FoodEvent {}

final class FilterFoodsEvent extends FoodEvent {
  final String searchParams;

  const FilterFoodsEvent(this.searchParams);

  @override
  List<Object?> get props => [searchParams];
}

final class GetSingleFoodEvent extends FoodEvent {
  final String id;

  const GetSingleFoodEvent(this.id);

  @override
  List<Object> get props => [id];
}
