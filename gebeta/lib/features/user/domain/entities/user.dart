import 'package:equatable/equatable.dart';

class User extends Equatable {
  final String firstName;
  final String lastName;
  final String email;
  final String password;
  final double height;
  final double weight;
  final double upperArmLength;
  final double armCircumference;
  final double hipCircumference;
  final double waistCircumference;
  final double upperLegLength;
  final int systolic;
  final int diastolic;
  final int pulse;

  const User({
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.password,
    required this.height,
    required this.weight,
    required this.upperArmLength,
    required this.armCircumference,
    required this.hipCircumference,
    required this.waistCircumference,
    required this.upperLegLength,
    required this.systolic,
    required this.diastolic,
    required this.pulse,
  });

  @override
  List<Object?> get props => [
        firstName,
        lastName,
        email,
        password,
        height,
        weight,
        upperArmLength,
        armCircumference,
        hipCircumference,
        waistCircumference,
        upperLegLength,
        systolic,
        diastolic,
        pulse,
      ];
}
