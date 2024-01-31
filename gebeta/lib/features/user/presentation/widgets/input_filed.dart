import 'package:flutter/material.dart';

import '../../../../core/theme/app_colors.dart';

class CustomInputField extends StatelessWidget {
  final String type;
  const CustomInputField(this.type, {super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController _textEditingController =
        TextEditingController();

    @override
    void dispose() {
      _textEditingController.dispose();
    }

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
          controller: _textEditingController,
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
