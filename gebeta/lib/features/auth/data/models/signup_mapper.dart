import '../../domain/entities/signup_entity.dart';
import 'signup_model.dart';

extension on SignupEntity {
  SignupModel toModel() {
    return SignupModel(
      username: username,
      password: password,
      firstName: firstName,
      lastName: lastName,
      height: height,
      weight: weight,
      upperLegLength: upperLegLength,
      upperArmLength: upperArmLength,
      armCircumference: armCircumference,
      waistCircumference: waistCircumference,
      hipCircumference: hipCircumference,
      systolic: systolic,
      diastolic: diastolic,
      pulse: pulse,
    );
  }
}