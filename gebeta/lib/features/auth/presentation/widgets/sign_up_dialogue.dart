import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../user/presentation/bloc/user_bloc.dart';
import '../bloc/auth_bloc.dart';
import 'input_field.dart';

class SignUpDialogue extends StatefulWidget {
  const SignUpDialogue({super.key});

  @override
  State<SignUpDialogue> createState() => _SignUpDialogueState();
}

class _SignUpDialogueState extends State<SignUpDialogue> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();

  @override
  void dispose() {
    _usernameController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 450.h,
      width: 380.w,
      padding: EdgeInsets.all(20.h),
      decoration: BoxDecoration(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(20.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Center(child: Text('Sign Up')),
          SizedBox(height: 30.h),
          InputField('username', controller: _usernameController),
          SizedBox(height: 25.h),
          InputField('password', controller: _passwordController),
          SizedBox(height: 25.h),
          InputField('confirm password', controller: _confirmPasswordController),
          SizedBox(height: 60.h),
          Container(
            width: double.infinity,
            height: 45.h,
            child: ElevatedButton(
              onPressed: () {
                BlocProvider.of<AuthBloc>(context).add(
                  AuthRegisterEvent(
                    _usernameController.text,
                    _passwordController.text,
                    // You can also use _confirmPasswordController.text if needed
                  ),
                );
              },
              child: const Text('Sign Up')
            ),
          ),
        ],
      ),
    );
  }
}
