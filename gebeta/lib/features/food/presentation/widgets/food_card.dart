import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/constants/constants.dart';
import '../../../../core/theme/app_colors.dart';
import '../../domain/entities/food.dart';

class FoodCard extends StatelessWidget {
  final Food food;
  final int index;
  const FoodCard(this.food, this.index, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(15),
      decoration: BoxDecoration(boxShadow: [
        BoxShadow(
          color: Colors.black
              .withOpacity(0.15), // Shadow color with some transparency
          offset: Offset(0, 4), // Shadow position
          blurRadius: 10, // Shadow blur radius
          spreadRadius: 1, // Shadow spread radius
        ),
      ], color: colors[index % 4], borderRadius: BorderRadius.circular(15.w)),
      child: Row(
        children: [
          SizedBox(
            width: 87.w,
            height: 91.h,
            child: ClipRect(
              child: CachedNetworkImage(
                imageUrl: food.photoUrl,
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(
            width: 20.w,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  food.description,
                  style: const TextStyle(fontSize: 16),
                ),
                Text(
                    '${(food.nutrients['nutrient_kcal'])!.toInt()}kcal'
                        .toString(),
                    style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w100,
                        color: AppColors.gray300)),
                SizedBox(
                  height: 20.h,
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
