import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class InputField extends StatelessWidget {
  final String hint;
  const InputField(this.hint, {super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 45.h, // Set the desired height
      child: TextField(
        decoration: InputDecoration(
          hintText: hint,
          hintStyle: const TextStyle(fontSize: 15, fontWeight: FontWeight.w100),
          contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 5.0),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
        ),
        style: const TextStyle(fontSize: 15),
      ),
    );
  }
}
