import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/usecase/usecase.dart';
import '../../domain/usecases/usecases.dart';
import 'Food_event.dart';
import 'Food_state.dart';

export 'Food_event.dart';
export 'Food_state.dart';

class FoodBloc extends Bloc<FoodEvent, FoodState> {
  final GetFood getFood;
  final GetFoods getAllFoods;
  final FilterFoods filterFoods;

  FoodBloc({
    required this.getFood,
    required this.getAllFoods,
    required this.filterFoods,
  }) : super(FoodInitialState()) {
    on<GetSingleFoodEvent>(_getFood);
    on<LoadAllFoodsEvent>(_getAllFoods);
    on<FilterFoodsEvent>(_filterFoods);
  }

  Future<void> _getFood(
      GetSingleFoodEvent event, Emitter<FoodState> emit) async {
    emit(FoodLoadingState());

    final result = await getFood(GetFoodParams(event.id));

    result.fold(
      (failure) => emit(FoodErrorState(failure.toString())),
      (Food) => emit(SingleFoodLoadedState(Food)),
    );
  }

  Future<void> _getAllFoods(
      LoadAllFoodsEvent event, Emitter<FoodState> emit) async {
    emit(FoodLoadingState());

    final result = await getAllFoods(NoParams());

    result.fold(
      (failure) => emit(FoodErrorState(failure.toString())),
      (Foods) => emit(AllFoodsLoadedState(Foods)),
    );
  }

  Future<void> _filterFoods(
      FilterFoodsEvent event, Emitter<FoodState> emit) async {
    final result = await filterFoods(FilterFoodsParams(event.searchParams));

    result.fold(
      (failure) => emit(FoodErrorState(failure.toString())),
      (Foods) => emit(AllFoodsFilteredState(Foods)),
    );
  }
}
