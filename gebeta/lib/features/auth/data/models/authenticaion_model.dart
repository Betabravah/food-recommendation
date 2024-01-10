import '../../domain/entities/auth_entity.dart';
import '../../domain/entities/signup_entity.dart';
import 'signup_model.dart';

class AuthenticationModel extends AuthenticationEntity {
  const AuthenticationModel(
      {required SignupEntity userInfo,
      required String token})
      : super(user: userInfo, token: token);

  factory AuthenticationModel.fromJson(Map<String, dynamic> json) {
    return AuthenticationModel(
      userInfo: SignupModel.fromJson(json['data']),
      token: json['token'],
    );
  }
}