import '../../domain/entities/user.dart';

class UserModel extends User {
  const UserModel({
    required super.firstName,
    required super.lastName,
    required super.email,
    required super.password,
    required super.height,
    required super.weight,
    required super.upperArmLength,
    required super.armCircumference,
    required super.hipCircumference,
    required super.waistCircumference,
    required super.upperLegLength,
    required super.systolic,
    required super.diastolic,
    required super.pulse,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      firstName: json['firstName'],
      lastName: json['lastName'],
      email: json['email'],
      password: json['password'],
      height: json['height'],
      weight: json['weight'],
      upperArmLength: json['upperArmLength'],
      armCircumference: json['armCircumference'],
      hipCircumference: json['hipCircumference'],
      waistCircumference: json['waistCircumference'],
      upperLegLength: json['upperLegLength'],
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
      'upperArmLength': upperArmLength,
      'armCircumference': armCircumference,
      'hipCircumference': hipCircumference,
      'waistCircumference': waistCircumference,
      'upperLegLength': upperLegLength,
      'systolic': systolic,
      'diastolic': diastolic,
      'pulse': pulse,
    };
  }
}
