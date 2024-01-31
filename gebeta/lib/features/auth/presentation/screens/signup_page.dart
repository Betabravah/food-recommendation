import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/presentation/route/routes.dart';
import '../../../../core/theme/app_colors.dart';
import '../widgets/sign_up_dialogue.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: 935.h,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                height: 650.h,
                child: Stack(
                  alignment: Alignment.topCenter,
                  children: [
                    const ClipRRect(
                      child: Image(
                        image: AssetImage('assets/images/top-vegies.png'),
                      ),
                    ),
                    Positioned(
                      top: 250.h,
                      child: SignUpDialogue(),
                    ),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Already have an account? ',
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                  GestureDetector(
                    onTap: () {
                      
                      context.push(Routes.login);
                    },
                    child: const Text(
                      'Sign In',
                      style: TextStyle(
                        color: AppColors.purple,
                        fontFamily: 'Poppins',
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  )
                ],
              ),
              ClipRRect(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(46.h),
                  bottomRight: Radius.circular(16.h),
                ),
                child: Image(
                  image: AssetImage('assets/images/bottom-vegies.png'),
                  // fit: BoxFit.cover,
                  // height: 250.h,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
