import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/theme/app_colors.dart';
import 'input_field.dart';

class SignInDialogue extends StatefulWidget {
  const SignInDialogue({super.key});

  @override
  State<SignInDialogue> createState() => _SignInDialogueState();
}

class _SignInDialogueState extends State<SignInDialogue> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 550.h,
      width: 380.w,
      padding: EdgeInsets.all(20.h),
      decoration: BoxDecoration(
        // color: Colors.grey,
        color: AppColors.gray150,
        borderRadius: BorderRadius.circular(20.0),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2), // Shadow color
            spreadRadius: 5, // Spread radius
            blurRadius: 10, // Blur radius
            offset: Offset(0, 3), // Offset in the x, y direction
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Center(
            child: Text('Sign In'),
          ),
          SizedBox(
            height: 80.h,
          ),
          const InputField('username'),
          SizedBox(
            height: 25.h,
          ),
          const InputField('password'),
          SizedBox(
            height: 100.h,
          ),
          Container(
              width: double.infinity,
              height: 45.h,
              child: ElevatedButton(
                  onPressed: () {}, child: const Text('Sign In')))
        ],
      ),
    );
  }
}
