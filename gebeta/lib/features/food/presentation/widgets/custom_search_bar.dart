import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/theme/app_colors.dart';
import '../bloc/food_bloc.dart';

class CustomSearchBar extends StatefulWidget {
  const CustomSearchBar({Key? key});

  @override
  _CustomSearchBarState createState() => _CustomSearchBarState();
}

class _CustomSearchBarState extends State<CustomSearchBar> {
  final TextEditingController _textEditingController = TextEditingController();

  @override
  void dispose() {
    _textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      // width: 376.w,
      height: 50.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(1000),
        color: Colors.grey.shade200,
      ),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: _textEditingController,
              style: const TextStyle(
                color: AppColors.darkerPurple,
                fontFamily: 'Poppins',
                fontSize: 18,
              ),
              decoration: const InputDecoration(
                hintText: 'Search',
                hintStyle: TextStyle(
                  color: AppColors.gray300,
                  fontFamily: 'Poppins',
                  fontSize: 18,
                  fontWeight: FontWeight.w200,
                ),
                contentPadding:
                    EdgeInsets.symmetric(vertical: 10.0, horizontal: 16.0),
                border: InputBorder.none,
                focusedBorder: InputBorder.none,
                enabledBorder: InputBorder.none,
              ),
              onSubmitted: (value) {
                BlocProvider.of<FoodBloc>(context).add(FilterFoodsEvent(value));
              },
            ),
          ),
        ],
      ),
    );
  }
}
