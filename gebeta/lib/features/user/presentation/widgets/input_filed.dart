import 'package:flutter/material.dart';

import '../../../../core/theme/app_colors.dart';

class CustomInputField extends StatelessWidget {
  final String type;
  final String defaultValue;
  final TextEditingController controller;

  CustomInputField(this.type, this.controller,
      {super.key, this.defaultValue = ''});

  // @override
  // void dispose() {
  //   _textEditingController.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    controller.text = defaultValue;

    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Text(
        type,
        style: const TextStyle(fontSize: 20),
      ),
      Container(
        decoration: BoxDecoration(
          color: AppColors.gray200,
          borderRadius: BorderRadius.circular(1000),
        ),
        child: TextField(
          controller: controller,
          style: const TextStyle(
            color: AppColors.darkerPurple,
            fontFamily: 'Poppins',
            fontSize: 18,
          ),
          decoration: InputDecoration(
            hintText: 'enter ${type.toLowerCase()}...',
            hintStyle: const TextStyle(
              color: AppColors.gray400,
              fontFamily: 'Poppins',
              fontSize: 16,
              fontWeight: FontWeight.w200,
            ),
            contentPadding:
                const EdgeInsets.symmetric(vertical: 10.0, horizontal: 16.0),
            border: InputBorder.none,
            focusedBorder: InputBorder.none,
            enabledBorder: InputBorder.none,
          ),
          onSubmitted: (value) {},
        ),
      ),
    ]);
  }
}
