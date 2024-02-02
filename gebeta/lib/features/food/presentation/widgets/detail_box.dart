import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../domain/entities/food.dart';
import 'tags.dart';

class DetailBox extends StatelessWidget {
  final Food food;
  const DetailBox(this.food, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(15.h),
      height: 400.h,
      decoration: const BoxDecoration(
        color: Colors.transparent,
      ),
      child: SingleChildScrollView(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            food.description,
            style: const TextStyle(
                fontFamily: 'Poppins',
                color: Colors.white,
                fontSize: 30,
                fontWeight: FontWeight.bold),
          ),
          Text(
            food.description,
            style: const TextStyle(
                color: Colors.white, fontSize: 20, fontWeight: FontWeight.w300),
            overflow: TextOverflow.visible,
          ),
          SizedBox(
            height: 50.h,
          ),
          Row(
            // mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Tag(
                0,
                '${food.nutrition['nutrient_kcal']} kcal',
              ),
              SizedBox(
                width: 30.w,
              ),
              Tag(1, 'vegan')
            ],
          ),
          SizedBox(
            height: 30.h,
          )
        ],
      )),
    );
  }
}
