import '../../../domain/entities/authentitcation_entity.dart';
import '../../models/auth_model.dart';

abstract class AuthRemoteDataSource {
  /// Returns [AuthenticationEntity] after a successful login
  ///
  /// Throws a [ServerException] for server errors
  /// Throws  a [LoginException] for login errors
  Future<AuthenticationEntity> login(AuthModel authModel);

  /// Returns [AuthenticatedUserInfo] after a successful sign up
  ///
  /// Throws a [ServerException] for server errors
  /// Throws a [SignUpException] for sign up errors
  Future<AuthModel> signup(AuthModel authModel);

  /// Returns [void] after a successful logout
  ///
  /// Throws a [ServerException] for server errors
  /// Throws a [LogoutException] for logout errors
  Future<void> logout(String token);
}
