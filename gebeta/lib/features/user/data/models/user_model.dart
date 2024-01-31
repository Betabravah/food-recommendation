import '../../domain/entities/user.dart';

class UserModel extends User {
  const UserModel({
    String? firstName,
    String? lastName,
    required String username,
    required String email,
    String? password,
    double? height,
    double? weight,
    double? upperArmLength,
    double? armCircumference,
    double? hipCircumference,
    double? waistCircumference,
    double? upperLegLength,
    int? systolic,
    int? diastolic,
    int? pulse,
  }) : super(
          firstName: firstName,
          lastName: lastName,
          username: username,
          email: email,
          password: password,
          height: height,
          weight: weight,
          upperArmLength: upperArmLength,
          armCircumference: armCircumference,
          hipCircumference: hipCircumference,
          waistCircumference: waistCircumference,
          upperLegLength: upperLegLength,
          systolic: systolic,
          diastolic: diastolic,
          pulse: pulse,
        );

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      firstName: json['firstName'] as String?,
      lastName: json['lastName'] as String?,
      username: json['username'] as String, // Ensure this is a required field
      email: json['email'] as String,
      password: json['password'] as String?,
      height: json['height'] as double?,
      weight: json['weight'] as double?,
      upperArmLength: json['upperArmLength'] as double?,
      armCircumference: json['armCircumference'] as double?,
      hipCircumference: json['hipCircumference'] as double?,
      waistCircumference: json['waistCircumference'] as double?,
      upperLegLength: json['upperLegLength'] as double?,
      systolic: json['systolic'] as int?,
      diastolic: json['diastolic'] as int?,
      pulse: json['pulse'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'firstName': firstName,
      'lastName': lastName,
      'username': username,
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
