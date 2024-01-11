import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

import '../../../../../core/constants/local_storage.dart';
import '../../../../../core/error/exceptions.dart';
import '../../../domain/entities/user.dart';
import '../../models/user_model.dart';
import 'local_datasource.dart';

class LocalDataSourceImpl implements LocalDataSource {
  final SharedPreferences sharedPreferences;

  LocalDataSourceImpl({required this.sharedPreferences});

  @override
  Future<void> cacheToken(String token) {
    return sharedPreferences.setString(LocalStorageConstants.TOKEN, token);
  }

  @override
  Future<void> cacheUser(UserModel user) {
    return sharedPreferences.setString(
        LocalStorageConstants.USERINFO, user.toJson().toString());
  }

  @override
  Future<String?> getToken() async {
    return sharedPreferences.getString(LocalStorageConstants.TOKEN);
  }

  @override
  Future<User> getUser(String token) {
    final userInfo =
        sharedPreferences.getString(LocalStorageConstants.USERINFO);

    if (userInfo != null) {
      final decoded = jsonDecode(userInfo);
      return Future.value(UserModel.fromJson(decoded));
    } else {
      throw const CacheException();
    }
  }
}
