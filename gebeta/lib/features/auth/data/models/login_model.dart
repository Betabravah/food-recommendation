import '../../domain/entities/login_entity.dart';

class LoginModel extends LoginEntity {
  const LoginModel({required super.username, required super.password});

  factory LoginModel.fromJson(Map<String, dynamic> json) {
    return LoginModel(
      username: json['username'],
      password: json['password'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'username': username,
      'password': password,
    };
  }
}
