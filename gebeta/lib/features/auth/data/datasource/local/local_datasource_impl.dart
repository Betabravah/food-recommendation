import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

import '../../../../../core/constants/local_storage.dart';
import '../../../../../core/error/exceptions.dart';
import '../../models/signup_model.dart';
import 'local_datasource.dart';

class AuthLocalDataSourceImpl extends AuthLocalDataSource {
  final SharedPreferences sharedPreferences;
  AuthLocalDataSourceImpl({
    required this.sharedPreferences,
  });

  @override
  Future<void> cacheLoggedInUser(SignupModel userToCache) async {
    final userInfo = jsonEncode(userToCache.toJson());

    sharedPreferences.setString(LocalStorageConstants.USERINFO, userInfo);
  }

  @override
  Future<SignupModel> getLoggedInUser() {
    final userInfo =
        sharedPreferences.getString(LocalStorageConstants.USERINFO);
    if (userInfo != null) {
      return Future.value(SignupModel.fromJson(jsonDecode(userInfo)));
    } else {
      throw const CacheException(message: 'User info not found');
    }
  }

  @override
  Future<void> cacheToken(String token) async {
    await sharedPreferences.setString(LocalStorageConstants.TOKEN, token);
  }

  @override
  Future<void> removeToken() async {
    await sharedPreferences.remove(LocalStorageConstants.TOKEN);
  }

  @override
  Future<String> getToken() {
    final token = sharedPreferences.getString(LocalStorageConstants.TOKEN);
    if (token != null) {
      return Future.value(token);
    } else {
      throw const CacheException(message: 'Token not found');
    }
  }

  @override
  Future<void> deleteLoggedInUser() async {
    sharedPreferences.remove(LocalStorageConstants.USERINFO);
    sharedPreferences.remove(LocalStorageConstants.TOKEN);
  }
}
