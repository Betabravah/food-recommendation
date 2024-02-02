import 'dart:ui';

import '../../features/food/domain/entities/food.dart';
import '../../features/user/domain/entities/user.dart';

const apiBaseUrl = 'http://192.168.72.128:5000/api';

User user = const User(
  username: 'sampleUsername',
  // Optional fields can be omitted or set to null or a specific value
  firstName: 'John',
  lastName: 'Doe',
  password: 'password123',
  height: 175.0,
  weight: 70.0,
  upperArmLength: 25.0,
  armCircumference: 30.0,
  hipCircumference: 95.0,
  waistCircumference: 80.0,
  upperLegLength: 45.0,
  systolic: 120,
  diastolic: 80,
  pulse: 70,
);

var mean_user_attributes = {
  "weight": 76.410956,
  "height": 163.512096,
  "bmi": 28.100621,
  "upper_leg_length": 38.745666,
  "upper_arm_length": 36.566440,
  "arm_circumference": 31.807006,
  "waist_circumference": 94.448656,
  "hip_circumference": 105.696877,
  "systolic": 119.806263,
  "diastolic": 71.599455,
  "pulse": 71.893791,
};

Food newFood = const Food(
    category: 'Fruit',
    description:
        'Food DescriptionThe interviewee demonstrated challenges in communication during the interview, which impacted the effectiveness of the interaction. It was observed that conveying ideas clearly and listening attentively were areas needing improvement. Additionally, there was a noticeable resistance to accepting suggestions and assistance, highlighting a need for greater openness to feedback, which is crucial for professional development. The interviewee also left the meeting earlier than scheduled without prior communication, indicating an area for improvement in professional etiquette, particularly in respecting the scheduled time and commitments of others. Overall, it is recommended that the interviewee seeks opportunities to enhance communication skills, adopts a more receptive approach to feedback, and adheres to professional norms regarding meeting commitments to improve future professional interactions.',
    images: [
      'https://images.unsplash.com/photo-1512621776951-a57141f2eefd?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D'
    ],
    nutrition: {});

List<Food> foods = [
  newFood,
  newFood,
  newFood,
  newFood,
  newFood,
  newFood,
  newFood,
  newFood,
  newFood
];

List<Color> colors = [
  Color(0xFFC9DFFC),
  Color(0xFFFCFEDC),
  Color(0xFFDCFBC9),
  Color(0xFFFCCEF8),
];
