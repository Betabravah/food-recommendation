import '../../domain/entities/signup_entity.dart';

class SignupModel extends SignupEntity {
  final String firstName;
  final String lastName;
  final String email;
  final String password;
  final double height;
  final double weight;
  final double upperLegLength;
  final double upperArmLength;
  final double armCircumference;
  final double waistCircumference;
  final double hipCircumference;
  final double systolic;
  final double diastolic;
  final double pulse;

  SignupModel(
      {required this.firstName,
      required this.lastName,
      required this.email,
      required this.password,
      required this.height,
      required this.weight,
      required this.upperLegLength,
      required this.upperArmLength,
      required this.armCircumference,
      required this.waistCircumference,
      required this.hipCircumference,
      required this.systolic,
      required this.diastolic,
      required this.pulse})
      : super(
            firstName: firstName,
            lastName: lastName,
            email: email,
            password: password,
            height: height,
            weight: weight,
            upperLegLength: upperLegLength,
            upperArmLength: upperArmLength,
            armCircumference: armCircumference,
            waistCircumference: waistCircumference,
            hipCircumference: hipCircumference,
            systolic: systolic,
            diastolic: diastolic,
            pulse: pulse);


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
