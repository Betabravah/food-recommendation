import '../../models/food_model.dart';

abstract class RemoteDataSource {
  Future<FoodModel> getFood(String id);
  Future<List<FoodModel>> getFoods();
  Future<List<FoodModel>> filterFoods(String query);
}
