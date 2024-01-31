import '../../models/user_model.dart';

abstract class UserRemoteDataSource {
  Future<UserModel> getUser(String token);

  Future<UserModel> updateUser(UserModel user);

  Future<UserModel> deleteUser(String token);
}