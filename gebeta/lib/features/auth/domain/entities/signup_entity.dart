import 'package:equatable/equatable.dart';

class SignupEntity extends Equatable {
  final String firstName;
  final String lastName;
  final String username;
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

  const SignupEntity(
      {required this.firstName,
      required this.lastName,
      required this.username,
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
      required this.pulse});

  @override
  List<Object?> get props => [
        firstName,
        lastName,
        username,
        password,
        height,
        weight,
        upperLegLength,
        upperArmLength,
        armCircumference,
        waistCircumference,
        hipCircumference,
        systolic,
        diastolic,
        pulse
      ];
}
