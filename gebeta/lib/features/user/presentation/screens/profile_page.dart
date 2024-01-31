import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/theme/app_colors.dart';
import '../../domain/entities/user.dart';
import '../widgets/input_filed.dart';

class ProfilePage extends StatelessWidget {
  final User user;
  const ProfilePage(this.user, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Container(
          padding: EdgeInsets.only(top: 50.h, left: 16.w, right: 16.w),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Row(
              children: [
                IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const Icon(Icons.arrow_back_ios)),
                Expanded(child: Container()),
                const Text(
                  'Profile',
                  style: TextStyle(fontSize: 20, fontFamily: 'Poppins'),
                ),
                Expanded(child: Container()),
                IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      size: 30,
                      Icons.save,
                      color: AppColors.purple,
                    )),
              ],
            ),
            SizedBox(
              height: 30.h,
            ),
            Center(
              child: SizedBox(
                  width: 150.w,
                  height: 150.h,
                  child: ClipRRect(
                      borderRadius: BorderRadius.circular(10.0),
                      child: const Image(
                        image: AssetImage('assets/images/profile.png'),
                      ))),
            ),
            SizedBox(
              height: 30.h,
            ),
            const CustomInputField('First Name'),
            const CustomInputField('Last Name'),
            const CustomInputField('Username'),
            const CustomInputField('Email'),
            const CustomInputField('Height'),
            const CustomInputField('Weight'),
            const CustomInputField('Upper Arm Length'),
            const CustomInputField('Upper Leg Length'),
            const CustomInputField('Arm Circumference'),
            const CustomInputField('Hip Circumference'),
            const CustomInputField('Waist Circumference'),
            const CustomInputField('Systolic Blood Pressure'),
            const CustomInputField('Diastolic Blood Pressure'),
            const CustomInputField('Pulse Rate'),
            SizedBox(
              height: 40.h,
            ),
            Center(
              child: SizedBox(
                  width: 200.w,
                  child: ElevatedButton(
                      onPressed: () {}, child: Text('Save Changes'))),
            ),
            SizedBox(
              height: 40.h,
            ),
          ])),
    ));
  }
}
