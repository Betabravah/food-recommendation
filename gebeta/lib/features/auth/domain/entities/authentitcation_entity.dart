import 'package:equatable/equatable.dart';

import 'auth_entity.dart';

class AuthenticationEntity extends Equatable {
  final String token;
  final AuthEntity user;

  const AuthenticationEntity({
    required this.token,
    required this.user,
  });

  @override
  List<Object?> get props => [token, user];
}
