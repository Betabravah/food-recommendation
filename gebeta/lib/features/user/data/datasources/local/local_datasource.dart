import '../../../domain/entities/user.dart';
import '../../models/user_model.dart';

abstract class LocalDataSource {
  Future<User> getUser(String token);

  Future<void> cacheUser(UserModel user);
  Future<void> cacheToken(String token);
  Future<String?> getToken();
}
