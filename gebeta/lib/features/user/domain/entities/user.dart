import 'package:equatable/equatable.dart';

class User extends Equatable {
  final String? firstName;
  final String? lastName;
  final String username; // Required
  final String email; // Required
  final String? password;
  final double? height;
  final double? weight;
  final double? upperArmLength;
  final double? armCircumference;
  final double? hipCircumference;
  final double? waistCircumference;
  final double? upperLegLength;
  final int? systolic;
  final int? diastolic;
  final int? pulse;

  const User({
    this.firstName,
    this.lastName,
    required this.username,
    required this.email,
    this.password,
    this.height,
    this.weight,
    this.upperArmLength,
    this.armCircumference,
    this.hipCircumference,
    this.waistCircumference,
    this.upperLegLength,
    this.systolic,
    this.diastolic,
    this.pulse,
  });

  @override
  List<Object?> get props => [
        firstName,
        lastName,
        username,
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
