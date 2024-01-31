import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/theme/app_colors.dart';
import '../../domain/entities/auth_entity.dart';
import '../bloc/auth_bloc.dart';
import 'input_field.dart';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/theme/app_colors.dart';
import 'input_field.dart';

class SignInDialogue extends StatefulWidget {
  const SignInDialogue({super.key});

  @override
  State<SignInDialogue> createState() => _SignInDialogueState();
}

class _SignInDialogueState extends State<SignInDialogue> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    _usernameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 550.h,
      width: 380.w,
      padding: EdgeInsets.all(20.h),
      decoration: BoxDecoration(
        color: AppColors.gray150,
        borderRadius: BorderRadius.circular(20.0),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            spreadRadius: 5,
            blurRadius: 10,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Center(
            child: Text('Sign In'),
          ),
          SizedBox(
            height: 80.h,
          ),
          InputField('username', controller: _usernameController),
          SizedBox(
            height: 25.h,
          ),
          InputField('password', controller: _passwordController),
          SizedBox(
            height: 100.h,
          ),
          Container(
            width: double.infinity,
            height: 45.h,
            child: ElevatedButton(
              onPressed: () {
                BlocProvider.of<AuthBloc>(context)
                    .add(AuthLoginEvent(AuthEntity(
                  username: _usernameController.text,
                  password: _passwordController.text,
                )));
              },
              child: const Text('Sign In'),
            ),
          ),
        ],
      ),
    );
  }
}
