import '../../../domain/entities/food.dart';
import '../../models/food_model.dart';

abstract class FoodLocalDataSource {
  Future<Food> getFood(String id);
  Future<List<Food>> getFoods();

  Future<void> cacheFood(FoodModel food);
  Future<void> cacheFoods(List<FoodModel> foods);
}
