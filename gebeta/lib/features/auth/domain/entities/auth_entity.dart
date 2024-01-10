import 'package:equatable/equatable.dart';

import 'signup_entity.dart';

class AuthenticationEntity extends Equatable {
  final String token;
  final SignupEntity user;

  const AuthenticationEntity({
    required this.token,
    required this.user,
  });

  @override
  List<Object?> get props => [token, user];
}