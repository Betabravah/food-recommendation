import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../domain/entities/food.dart';
import 'food_card.dart';

class FoodList extends StatelessWidget {
  final List<Food> foods;

  const FoodList(this.foods, {super.key});

  @override
  Widget build(BuildContext context) {
    print(foods.length);
    print("<<<<<<<");
    return SizedBox(
      height: 430.h,
      child: ListView.builder(
        itemCount: foods.length,
        itemBuilder: (context, index) {
          Food food = foods[index];
          return Padding(
              padding: const EdgeInsets.only(bottom: 15),
              child: FoodCard(food, index));
        },
      ),
    );
  }
}
