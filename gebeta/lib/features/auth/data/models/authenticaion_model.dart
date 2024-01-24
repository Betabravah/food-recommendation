import '../../domain/entities/auth_entity.dart';
import '../../domain/entities/authentitcation_entity.dart';
import 'auth_model.dart';

class AuthenticationModel extends AuthenticationEntity {
  const AuthenticationModel(
      {required AuthEntity userInfo, required String token})
      : super(user: userInfo, token: token);

  factory AuthenticationModel.fromJson(Map<String, dynamic> json) {
    return AuthenticationModel(
      userInfo: AuthModel.fromJson(json['data']),
      token: json['token'],
    );
  }
}
