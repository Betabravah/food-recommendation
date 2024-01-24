import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/theme/app_colors.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(16),
        child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
          Stack(
            alignment: Alignment.center,
            children: [
              const Image(image: AssetImage('assets/images/fruit_circle.png')),
              Text(
                'Gebeta',
                style: Theme.of(context).textTheme.displayLarge,
              )
            ],
          ),
          SizedBox(
            height: 30.h,
          ),
          Container(
            padding: EdgeInsets.only(left: 10.w, right: 10.w),
            alignment: Alignment.center,
            child: Text(
              'Every nutrient fact for your everyday food',
              style: Theme.of(context).textTheme.bodyLarge,
              textAlign:
                  TextAlign.center, // Center the text within the container
            ),
          ),
          SizedBox(
            height: 35.h,
          ),
          ElevatedButton(
              style: ButtonStyle(
                minimumSize: MaterialStateProperty.all(Size(250, 50)),
              ),
              onPressed: () {},
              child: const Text('Sign Up')),
          SizedBox(
            height: 30.h,
          ),
          Text(
            'Already have an account?',
            style: Theme.of(context).textTheme.bodySmall,
          ),
          SizedBox(
            height: 30.h,
          ),
          ElevatedButton(
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(Colors.transparent),
              elevation: MaterialStateProperty.all(0), // Set elevation to zero
              minimumSize: MaterialStateProperty.all(Size(150, 50)),
              shape: MaterialStateProperty.all(
                RoundedRectangleBorder(
                  side: const BorderSide(color: AppColors.purple),
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
            ),
            onPressed: () {
              // Define the function to be executed when the button is pressed
              // You can add your sign-up logic here
            },
            child: const Text(
              'Sign Up',
              style: TextStyle(color: AppColors.purple),
            ),
          ),
          SizedBox(
            height: 30.h,
          ),
          Text(
            'Be healthy 😂',
            style: Theme.of(context).textTheme.bodySmall,
          )
        ]),
      ),
    );
  }
}
