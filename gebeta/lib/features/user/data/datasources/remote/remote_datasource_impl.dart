import 'dart:convert';

import 'package:http/http.dart' as http;

import '../../../../../core/constants/constants.dart';
import '../../../../../core/error/exceptions.dart';
import '../../models/user_model.dart';
import 'remote_datasource.dart';

class RemoteDataSourceImpl implements RemoteDataSource {
  final http.Client client;

  RemoteDataSourceImpl({
    required this.client,
  });

  @override
  Future<UserModel> deleteUser(String token) async {
    final http.Response response = await client.delete(
        Uri.parse('${apiBaseUrl}user'),
        body: jsonEncode({'token': token}),
        headers: {'Content-Type': 'application/json'});

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
    final http.Response response = await client.get(
        Uri.parse('${apiBaseUrl}user'),
        headers: {'Content-Type': 'application/json'});

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
  Future<UserModel> updateUser(UserModel user) async {
    final http.Response response = await client.put(
      Uri.parse('${apiBaseUrl}user'),
      body: jsonEncode(user.toJson()),
      headers: {'Content-Type': 'application/json'},
    );

    if (response.statusCode == 200) {
      final responseBody = jsonDecode(response.body);
      return UserModel.fromJson(responseBody['data']);
    } else if (response.statusCode == 400) {
      throw const ServerException(message: 'Invalid Credentials');
    } else {
      throw const ServerException(message: 'Server Error');
    }
  }
}