import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

import './local_datasource.dart';
import '../../../../../core/constants/local_storage.dart';
import '../../../../../core/error/exceptions.dart';
import '../../models/food_model.dart';

class FoodLocalDatasourceImpl implements FoodLocalDataSource {
  final SharedPreferences sharedPreferences;

  const FoodLocalDatasourceImpl({required this.sharedPreferences});

  @override
  Future<void> cacheFood(FoodModel food) async {
    final foods = await getFoods();

    final foodIndex =
        foods.indexWhere((element) => element.description == food.description);

    if (foodIndex == -1) {
      foods.add(food);
    } else {
      foods[foodIndex] = food;
    }

    await cacheFoods(foods);
  }

  @override
  Future<void> cacheFoods(List<FoodModel> foods) {
    final jsonEncoded = jsonEncode(foods);
    return sharedPreferences.setString(
        LocalStorageConstants.FOODS, jsonEncoded);
  }

  @override
  Future<FoodModel> getFood(String description) async {
    final foods = await getFoods();

    for (final food in foods) {
      if (food.description == description) {
        return food;
      }
    }

    throw const CacheException(message: 'Food Not Found');
  }

  @override
  Future<List<FoodModel>> getFoods() async {
    final jsonEncoded =
        sharedPreferences.getString(LocalStorageConstants.FOODS);

    if (jsonEncoded != null) {
      final List<dynamic> jsonDecoded = jsonDecode(jsonEncoded);

      final foods =
          jsonDecoded.map<FoodModel>((map) => FoodModel.fromJson(map)).toList();

      return foods;
    }

    return <FoodModel>[];
  }
}
