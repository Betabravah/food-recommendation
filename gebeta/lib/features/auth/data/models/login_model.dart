import '../../domain/entities/login_entity.dart';

class LoginModel extends LoginEntity {
  final String email;
  final String password;

  const LoginModel({required this.email, required this.password})
      : super(email: email, password: password);

  factory LoginModel.fromJson(Map<String, dynamic> json) {
    return LoginModel(
      email: json['email'],
      password: json['password'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'email': email,
      'password': password,
    };
  }
}