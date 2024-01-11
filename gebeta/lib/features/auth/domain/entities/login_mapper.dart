import '../../data/models/login_model.dart';
import 'login_entity.dart';

extension on LoginEntity {
  LoginModel toLoginModel() {
    return LoginModel(
      email: email,
      password: password,
    );
  }
}