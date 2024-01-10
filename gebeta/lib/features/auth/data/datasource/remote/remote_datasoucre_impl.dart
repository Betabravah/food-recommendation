import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:gebeta/features/auth/data/datasource/remote/remote_datasource.dart';
import 'package:http/http.dart' as http;

import '../../../../../core/constants/constants.dart';
import '../../../../../core/error/exceptions.dart';
import '../../models/authenticaion_model.dart';
import '../../models/login_model.dart';
import '../../models/signup_model.dart';

class AuthRemoteDataSourceImpl extends AuthRemoteDataSource {
  final http.Client client;
  AuthRemoteDataSourceImpl({
    required this.client,
  });

  @override
  Future<AuthenticationModel> login(LoginModel loginRequestModel) async {
    final http.Response response = await client.post(
        Uri.parse('${apiBaseUrl}user/login'),
        body: jsonEncode(loginRequestModel.toJson()),
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
  Future<SignupModel> signUp(
      SignupModel signUpRequestModel) async {
    final http.Response response = await client.post(
        Uri.parse('${apiBaseUrl}user'),
        body: jsonEncode(signUpRequestModel.toJson()),
        headers: {'Content-Type': 'application/json'});
    if (response.statusCode == 200) {
      final responseBody = jsonDecode(response.body);
      return SignupModel.fromJson(responseBody['data']);
    } else if (response.statusCode == 409 || response.statusCode == 400) {
      throw const SignUpException(message: 'Invalid information');
    } else {
      throw const ServerException(message: 'Server Error');
    }
  }

  @override
  Future<void> logout(String token) async {
    final http.Response response = await client.post(
        Uri.parse('${apiBaseUrl}user/logout'),
        body: jsonEncode({'token': token}),
        headers: {'Content-Type': 'application/json'});

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