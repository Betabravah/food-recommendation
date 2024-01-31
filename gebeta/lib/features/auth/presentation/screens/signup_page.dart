import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/injection/dependency_injection.dart';
import '../../../../core/presentation/route/routes.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../food/presentation/widgets/snack_bar.dart';
import '../../../user/presentation/bloc/user_bloc.dart';
import '../bloc/auth_bloc.dart';
import '../widgets/sign_up_dialogue.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: BlocProvider<AuthBloc>(
      create: (context) => serviceLocator<AuthBloc>(),

      //
      child: Container(
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
                    BlocBuilder<AuthBloc, AuthState>(
                      builder: (context, state) {
                        if (state is AuthLoading) {
                          return CircularProgressIndicator();
                        } else if (state is AuthError) {
                          WidgetsBinding.instance.addPostFrameCallback((_) {
                            showError(
                                context,
                                state
                                    .message); // Show error message after build
                          });
                        }
                        // Return normal UI for other states
                        return Positioned(
                          top: 250.h,
                          child: SignUpDialogue(),
                        );
                      },
                    ),
                    BlocListener<AuthBloc, AuthState>(
                      listener: (context, state) {
                        if (state is AuthSuccess) {
                          context.go(Routes.login);
                        }
                      },
                      child: SizedBox.shrink(),
                    )
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
    ));
  }
}
