import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/constants/constants.dart';
import '../../../../core/theme/app_colors.dart';
import '../../domain/entities/food.dart';
import '../widgets/custom_search_bar.dart';
import '../widgets/display_card.dart';
import '../widgets/food_list.dart';
import '../widgets/profile_avatar.dart';

class HomePage extends StatefulWidget {
  final List<Food> foods;
  const HomePage(this.foods, {super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(top: 50.h, left: 16.w, right: 16.w),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Hello👋',
                  style: TextStyle(fontSize: 40, fontFamily: 'Poppins'),
                ),
                ProfileAvatar(
                    image:
                        'https://unsplash.com/photos/closeup-photography-of-woman-smiling-mEZ3PoFGs_k')
              ]),
          const CustomSearchBar(),
          SizedBox(
            height: 15.h,
          ),
          const DisplayCard(),
          SizedBox(
            height: 30.h,
          ),
          const Text(
            'Recommended Foods',
            style: TextStyle(fontSize: 20, color: AppColors.purple),
          ),
          SingleChildScrollView(child: FoodList(foods)),
        ]),
      ),
    );
  }
}
