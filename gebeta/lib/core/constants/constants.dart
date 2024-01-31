import 'dart:ui';

import '../../features/food/domain/entities/food.dart';

const apiBaseUrl = '';

Food newFood = const Food(
    description:
        'Food DescriptionThe interviewee demonstrated challenges in communication during the interview, which impacted the effectiveness of the interaction. It was observed that conveying ideas clearly and listening attentively were areas needing improvement. Additionally, there was a noticeable resistance to accepting suggestions and assistance, highlighting a need for greater openness to feedback, which is crucial for professional development. The interviewee also left the meeting earlier than scheduled without prior communication, indicating an area for improvement in professional etiquette, particularly in respecting the scheduled time and commitments of others. Overall, it is recommended that the interviewee seeks opportunities to enhance communication skills, adopts a more receptive approach to feedback, and adheres to professional norms regarding meeting commitments to improve future professional interactions.',
    id: '1',
    name: 'Salad',
    photoUrl: 'https://images.unsplash.com/photo-1512621776951-a57141f2eefd?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
    nutrients: {'nutrient_kcal': 40.0});

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
