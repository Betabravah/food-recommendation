import 'dart:convert';

import 'package:http/http.dart' as http;

import '../../../../../core/constants/constants.dart';
import '../../../../../core/error/exceptions.dart';
import '../../../../../core/network/custom_client.dart';
import '../../models/user_model.dart';
import 'remote_datasource.dart';

class UserRemoteDataSourceImpl implements UserRemoteDataSource {
  final CustomClient client;

  UserRemoteDataSourceImpl({
    required this.client,
  });

  @override
  Future<UserModel> deleteUser(String token) async {
    final http.Response response = await client.delete('$apiBaseUrl/user');

    if (response.statusCode == 200) {
      final responseBody = jsonDecode(response.body);
      return UserModel.fromJson(responseBody['data']);
    } else if (response.statusCode == 400) {
      throw const ServerException(message: 'Invalid Credentials');
    } else {
      throw const ServerException(message: 'Server Error');
    }
  }

  @override
  Future<UserModel> getUser(String token) async {
    final http.Response response = await client.get('$apiBaseUrl/user/profile',
        headers: {'Content-Type': 'application/json'});

    if (response.statusCode == 200) {
      final responseBody = jsonDecode(response.body);
      return UserModel.fromJson(responseBody['user']);
    } else if (response.statusCode == 400) {
      throw const ServerException(message: 'Invalid Credentials');
    } else {
      throw const ServerException(message: 'Server Error');
    }
  }

  @override
  Future<UserModel> updateUser(UserModel user) async {
    final http.Response response = await client.post(
      '$apiBaseUrl/user/profile',
      body: {'user': jsonEncode(user.toJson())},
      headers: {'Content-Type': 'application/json'},
    );
    print(response.body);
    if (response.statusCode == 200) {
      final responseBody = jsonDecode(response.body);
      return UserModel.fromJson(responseBody['user']);
    } else if (response.statusCode == 400) {
      throw const ServerException(message: 'Invalid Credentials');
    } else {
      throw const ServerException(message: 'Server Error');
    }
  }
}
