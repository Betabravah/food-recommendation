import '../../../domain/entities/auth_entity.dart';
import '../../models/login_model.dart';
import '../../models/signup_model.dart';

abstract class AuthRemoteDataSource {
  /// Returns [AuthenticationEntity] after a successful login
  ///
  /// Throws a [ServerException] for server errors
  /// Throws  a [LoginException] for login errors
  Future<AuthenticationEntity> login(LoginModel loginRequestModel);

  /// Returns [AuthenticatedUserInfo] after a successful sign up
  ///
  /// Throws a [ServerException] for server errors
  /// Throws a [SignUpException] for sign up errors
  Future<SignupModel> signup(SignupModel signUpRequestModel);

  /// Returns [void] after a successful logout
  ///
  /// Throws a [ServerException] for server errors
  /// Throws a [LogoutException] for logout errors
  Future<void> logout(String token);
}
