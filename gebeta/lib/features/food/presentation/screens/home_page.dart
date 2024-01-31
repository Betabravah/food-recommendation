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
      resizeToAvoidBottomInset: true, // Add this line
      body: SingleChildScrollView(
        // Wrap Column with SingleChildScrollView
        child: Container(
          padding: EdgeInsets.only(top: 50.h, left: 16.w, right: 16.w),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Hello👋',
                    style: TextStyle(fontSize: 40, fontFamily: 'Poppins'),
                  ),
                  ProfileAvatar(
                      image:
                          'https://images.unsplash.com/photo-1494790108377-be9c29b29330?q=80&w=1887&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D')
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
            FoodList(widget.foods), // Removed SingleChildScrollView from here
          ]),
        ),
      ),
    );
  }
}
