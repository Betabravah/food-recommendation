import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DisplayCard extends StatelessWidget {
  const DisplayCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200.h,
      width: MediaQuery.of(context)
          .size
          .width, // Set the width based on screen size
      child: Stack(children: [
        Positioned(
          bottom: 0,
          // Use Positioned.fill for better constraint management
          child: Container(
            height: 180.h,
            width: MediaQuery.of(context).size.width - 30.w,
            padding: EdgeInsets.only(left: 95.w),
            decoration: BoxDecoration(
                // color: Colors.amber,
                gradient: LinearGradient(
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                  colors: [
                    Colors.white,
                    Colors.pink.shade100,
                  ],
                ),
                borderRadius: BorderRadius.circular(20.w)),
            child: const Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    'Healthy body comes with good nutrients',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 18),
                  ),
                  Text(
                    'Start your journey now',
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.w200),
                  )
                ]),
          ),
        ),
        Positioned(
          // Position your images properly
          child: const Image(
            image: AssetImage('assets/images/grapes.png'),
          ),
        ),
        Positioned(
            bottom: 30,
            left: 20,
            child: const Image(
              image: AssetImage('assets/images/shadow.png'),
            )),
      ]),
    );
  }
}
