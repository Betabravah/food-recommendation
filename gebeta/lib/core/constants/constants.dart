import 'dart:ui';

import '../../features/food/domain/entities/food.dart';

const apiBaseUrl = '';

Food newFood = Food(
    description: "Food Description",
    id: '1',
    name: 'Salad',
    photoUrl:
        'https://unsplash.com/photos/bowl-of-vegetable-salads-IGfIGP5ONV0',
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
  Color(0xFFBFD7F7),
  Color(0xFFFCFEDC),
  Color(0xFFD4F7BF),
  Color(0xFFF7BFF2),
];
