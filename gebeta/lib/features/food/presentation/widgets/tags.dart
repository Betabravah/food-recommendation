import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Tag extends StatelessWidget {
  final int type;
  final String val;
  const Tag(this.type, this.val, {super.key});

  @override
  Widget build(BuildContext context) {
    Widget iconWidget = type == 0
        ? const Icon(Icons.whatshot, color: Color(0xFFEC534A))
        : const Icon(Icons.restaurant, color: Color(0xFFEC534A));

    return Container(
      height: 50.h,
      padding: EdgeInsets.symmetric(horizontal: 10.w),
      constraints: BoxConstraints(
        minWidth: 100.w, // Set your desired minimum width here
      ),
      decoration: BoxDecoration(
        color: const Color(0xFFDBF6D2),
        borderRadius: BorderRadius.circular(20.w),
      ),
      child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            iconWidget,
            SizedBox(width: 5.w),
            Text(val,
                style: const TextStyle(
                    color: Color(0xFFEC534A),
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w500,
                    fontSize: 16))
          ]),
    );
  }
}
