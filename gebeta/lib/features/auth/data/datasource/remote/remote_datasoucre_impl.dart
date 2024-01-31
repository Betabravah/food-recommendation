import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

import '../../../../../core/constants/constants.dart';
import '../../../../../core/error/exceptions.dart';
import '../../../../../core/network/custom_client.dart';
import '../../models/auth_model.dart';
import '../../models/authenticaion_model.dart';
import 'remote_datasource.dart';

class AuthRemoteDataSourceImpl extends AuthRemoteDataSource {
  final CustomClient client;
  AuthRemoteDataSourceImpl({
    required this.client,
  });

  @override
  Future<AuthenticationModel> login(AuthModel authModel) async {
    final http.Response response = await client.post('$apiBaseUrl/auth/login',
        body: {'authModel': jsonEncode(authModel.toJson())},
        headers: {'Content-Type': 'application/json'});

    if (response.statusCode == 200) {
      final responseBody = jsonDecode(response.body);
      if (kDebugMode) {
        print('responseBody: $responseBody');
      }
      return AuthenticationModel.fromJson(responseBody);
    } else if (response.statusCode == 400) {
      throw const LoginException(message: 'Invalid Credentials');
    } else {
      throw const ServerException(message: 'Server Error');
    }
  }

  @override
  Future<AuthModel> signup(AuthModel authModel) async {
    final http.Response response = await client.post('$apiBaseUrl/auth/register',
        body: {'authModel': jsonEncode(authModel.toJson())},
        headers: {'Content-Type': 'application/json'});
    if (response.statusCode == 200) {
      final responseBody = jsonDecode(response.body);
      return AuthModel.fromJson(responseBody['data']);
    } else if (response.statusCode == 409 || response.statusCode == 400) {
      throw const SignUpException(message: 'Invalid information');
    } else {
      throw const ServerException(message: 'Server Error');
    }
  }

  @override
  Future<void> logout(String token) async {
    final http.Response response =
        await client.post('${apiBaseUrl}user/logout', body: {
      'token': jsonEncode({'token': token})
    }, headers: {
      'Content-Type': 'application/json'
    });

    if (response.statusCode == 200) {
      return;
    } else if (response.statusCode == 401) {
      throw const LogoutException(
        message: 'Unauthorized',
      );
    } else {
      throw const ServerException(message: 'Server Error');
    }
  }
}
