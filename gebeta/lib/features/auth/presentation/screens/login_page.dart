import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/injection/dependency_injection.dart';
import '../../../../core/presentation/route/routes.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../food/presentation/widgets/snack_bar.dart';
import '../bloc/auth_bloc.dart';
import '../widgets/sign_in_dialogue.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider<AuthBloc>(
        create: (context) => serviceLocator<AuthBloc>(),
        child: Container(
          height: 930.h,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  height: 800.h,
                  child: Stack(
                    alignment: Alignment.topCenter,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(46.h),
                          bottomRight: Radius.circular(16.h),
                        ),
                        child: Image(
                          image: const AssetImage(
                              'assets/images/vegies-with-bg.png'),
                          fit: BoxFit.cover,
                          height: 300.h,
                        ),
                      ),
                      BlocBuilder<AuthBloc, AuthState>(
                        builder: (context, state) {
                          if (state is AuthLoading) {
                            return CircularProgressIndicator();
                          } else if (state is AuthError) {
                            WidgetsBinding.instance.addPostFrameCallback(
                              (_) {
                                showError(
                                    context,
                                    state
                                        .message); // Show error message after build
                              },
                            );
                          }
                          // Return normal UI for other states
                          return Positioned(
                            top: 250.h,
                            child: SignInDialogue(),
                          );
                        },
                      ),
                      BlocListener<AuthBloc, AuthState>(
                        listener: (context, state) {
                          if (state is UserAuthState) {
                            
                            print('1111111111111111111111');
                            context.go(Routes.foods);
                          }
                        },
                        child: SizedBox.shrink(),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 15.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Don\'t have an account? ',
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                    GestureDetector(
                      onTap: () {
                        context.push(Routes.signup);
                      },
                      child: const Text(
                        'Sign Up',
                        style: TextStyle(
                          color: AppColors.purple,
                          fontFamily: 'Poppins',
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
