import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../domain/entities/food.dart';
import '../widgets/detail_box.dart';

class FoodDetail extends StatelessWidget {
  final Food food;
  const FoodDetail(this.food, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: CachedNetworkImage(
              imageUrl: food.photoUrl, // Use the photoUrl from the food object
              fit: BoxFit.cover,
              placeholder: (context, url) =>
                  const CircularProgressIndicator(), // Optional: placeholder widget
              errorWidget: (context, url, error) =>
                  const Icon(Icons.error), // Optional: error widget
            ),
          ),
          Container(
            width: double.infinity,
            height: double.infinity,
            decoration: BoxDecoration(
              color: Colors.black.withOpacity(0.4), // Semi-transparent black
            ),
          ),
          Positioned(
              top: 25.h,
              left: 10.w,
              child: Row(
                children: [
                  IconButton(
                      onPressed: () => Navigator.pop(context),
                      icon: const Icon(
                        Icons.arrow_back_ios,
                        color: Colors.white,
                      )),
                ],
              )),
          Positioned(bottom: 0, left: 0, right: 0, child: DetailBox(food))
        ],
      ),
    );
  }
}
