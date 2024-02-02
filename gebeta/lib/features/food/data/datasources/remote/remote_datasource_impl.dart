import 'dart:convert';
import 'package:http/http.dart' as http;

import './remote_datasoucre.dart';
import '../../../../../core/constants/constants.dart';
import '../../../../../core/error/exceptions.dart';
import '../../../../../core/network/custom_client.dart';
import '../../models/food_model.dart';

class FoodRemoteDatasourceImpl implements FoodRemoteDataSource {
  final CustomClient client;

  const FoodRemoteDatasourceImpl({required this.client});

  @override
  Future<FoodModel> getFood(String id) async {
    try {
      final response = await client.get('$apiBaseUrl/foods/$id');

      if (response.statusCode == 200) {
        final decoded = jsonDecode(response.body);
        return FoodModel.fromJson(decoded);
      } else {
        throw const ServerException(message: 'Food Not Found');
      }
    } catch (e) {
      throw const ServerException(message: 'Server Error');
    }
  }

  @override
  Future<List<FoodModel>> getFoods() async {
    try {
      final response = await client.get('$apiBaseUrl/user/food');

      if (response.statusCode == 200) {
        final decoded = jsonDecode(response.body) as Map<String, dynamic>;

        final foods = decoded['foods'] as List<dynamic>;

        return foods
            .map<FoodModel>(
                (map) => FoodModel.fromJson(map as Map<String, dynamic>))
            .toList();
      } else {
        throw const ServerException(message: 'Bad Request');
      }
    } catch (e) {
      throw const ServerException(message: 'Server Error');
    }
  }

  @override
  Future<List<FoodModel>> filterFoods(String query) async {
    try {
      final response =
          await client.get('$apiBaseUrl/food', queryParams: {'query': query});

      if (response.statusCode == 200) {
        final decoded = jsonDecode(response.body) as Map<String, dynamic>;

        final foods = decoded['foods'] as List<dynamic>;

        return foods
            .map<FoodModel>(
                (map) => FoodModel.fromJson(map as Map<String, dynamic>))
            .toList();
      } else {
        throw const ServerException(message: 'Bad Request');
      }
    } catch (e) {
      throw const ServerException(message: 'Server Error');
    }
  }
}
