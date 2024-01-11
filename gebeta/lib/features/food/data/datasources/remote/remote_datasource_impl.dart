import 'dart:convert';

import 'package:http/http.dart' as http;

import './remote_datasoucre.dart';
import '../../../../../core/constants/constants.dart';
import '../../../../../core/error/exceptions.dart';
import '../../models/food_model.dart';

class RemoteDatasourceImpl implements RemoteDataSource {
  final http.Client client;

  const RemoteDatasourceImpl(this.client);

  @override
  Future<FoodModel> getFood(String id) async {
    try {
      final response = await client.get(Uri.parse('$apiBaseUrl/foods/$id'));

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
      final response = await client.get(Uri.parse('$apiBaseUrl/foods'));

      if (response.statusCode == 200) {
        final decoded = jsonDecode(response.body);
        return Future.value(
            decoded.map<FoodModel>((map) => FoodModel.fromJson(map)).toList());
      } else {
        throw const ServerException(message: 'Bad Request');
      }
    } catch (e) {
      throw const ServerException(message: 'Server Error');
    }
  }
}
