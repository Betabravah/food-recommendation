import '../../domain/entities/signup_entity.dart';

class SignupModel extends SignupEntity {
  const SignupModel(
      {required super.firstName,
      required super.lastName,
      required super.email,
      required super.password,
      required super.height,
      required super.weight,
      required super.upperLegLength,
      required super.upperArmLength,
      required super.armCircumference,
      required super.waistCircumference,
      required super.hipCircumference,
      required super.systolic,
      required super.diastolic,
      required super.pulse});

  factory SignupModel.fromJson(Map<String, dynamic> json) {
    return SignupModel(
      firstName: json['firstName'],
      lastName: json['lastName'],
      email: json['email'],
      password: json['password'],
      height: json['height'],
      weight: json['weight'],
      upperLegLength: json['upperLegLength'],
      upperArmLength: json['upperArmLength'],
      armCircumference: json['armCircumference'],
      waistCircumference: json['waistCircumference'],
      hipCircumference: json['hipCircumference'],
      systolic: json['systolic'],
      diastolic: json['diastolic'],
      pulse: json['pulse'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'firstName': firstName,
      'lastName': lastName,
      'email': email,
      'password': password,
      'height': height,
      'weight': weight,
      'upperLegLength': upperLegLength,
      'upperArmLength': upperArmLength,
      'armCircumference': armCircumference,
      'waistCircumference': waistCircumference,
      'hipCircumference': hipCircumference,
      'systolic': systolic,
      'diastolic': diastolic,
      'pulse': pulse,
    };
  }
}
