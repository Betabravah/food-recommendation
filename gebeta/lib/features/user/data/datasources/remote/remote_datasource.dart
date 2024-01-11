import '../../models/user_model.dart';

abstract class RemoteDataSource {
  Future<UserModel> getUser(String token);

  Future<UserModel> updateUser(UserModel user);

  Future<UserModel> deleteUser(String token);
}