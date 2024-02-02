import '../../domain/entities/user.dart';

class UserModel extends User {
  const UserModel({
    String? firstName,
    String? lastName,
    required String username,
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
      firstName:
          json.containsKey('firstName') ? json['firstName'] as String? : null,
      lastName:
          json.containsKey('firstName') ? json['firstName'] as String? : null,
      username: json['username'] as String, // Ensure this is a required field

      password:
          json.containsKey('password') ? json['password'] as String? : null,
      height: json.containsKey('height') ? json['height'] as double? : null,
      weight: json.containsKey('weight') ? json['weight'] as double? : null,
      upperArmLength: json.containsKey('upperArmLength')
          ? json['upperArmLength'] as double?
          : null,
      armCircumference: json.containsKey('armCircumference')
          ? json['armCircumference'] as double?
          : null,
      hipCircumference: json.containsKey('hipCircumference')
          ? json['hipCircumference'] as double?
          : null,
      waistCircumference: json.containsKey('waistCircumference')
          ? json['waistCircumference'] as double?
          : null,
      upperLegLength: json.containsKey('upperLegLength')
          ? json['upperLegLength'] as double?
          : null,
      systolic: json.containsKey('systolic') ? json['systolic'] as int? : null,
      diastolic:
          json.containsKey('diastolic') ? json['diastolic'] as int? : null,
      pulse: json.containsKey('pulse') ? json['pulse'] as int? : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'firstName': firstName,
      'lastName': lastName,
      'username': username,
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
