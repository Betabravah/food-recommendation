import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'input_field.dart';

class SignUpDialogue extends StatefulWidget {
  const SignUpDialogue({super.key});

  @override
  State<SignUpDialogue> createState() => _SignUpDialogueState();
}

class _SignUpDialogueState extends State<SignUpDialogue> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 450.h,
      width: 380.w,
      padding: EdgeInsets.all(20.h),
      decoration: BoxDecoration(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(
            20.0), // Set the radius as per your preference
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Center(
            child: Text('Sign Up'),
          ),
          SizedBox(
            height: 30.h,
          ),
          const InputField('username'),
          SizedBox(
            height: 25.h,
          ),
          const InputField('password'),
          SizedBox(
            height: 25.h,
          ),
          const InputField('confirm password'),
          SizedBox(
            height: 60.h,
          ),
          Container(
              width: double.infinity,
              height: 45.h,
              child: ElevatedButton(
                  onPressed: () {}, child: const Text('Sign Up')))
        ],
      ),
    );
  }
}
