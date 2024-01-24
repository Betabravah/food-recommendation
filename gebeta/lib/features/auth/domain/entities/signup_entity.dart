import 'package:equatable/equatable.dart';

class SignupEntity extends Equatable {
  final String username;
  final String password;

  const SignupEntity({
    required this.username,
    required this.password,
  });

  @override
  List<Object?> get props => [
        username,
        password,
      ];
}
