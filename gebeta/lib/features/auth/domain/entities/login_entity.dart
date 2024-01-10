import 'package:equatable/equatable.dart';

class LoginEntity extends Equatable {
  final String email;
  final String password;

  const LoginEntity(this.email, this.password);

  @override
  List<Object?> get props => [email, password];
}
