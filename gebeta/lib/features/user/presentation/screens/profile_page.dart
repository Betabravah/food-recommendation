import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/constants/constants.dart';
import '../../../../core/injection/dependency_injection.dart';
import '../../../../core/network/custom_client.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../food/presentation/bloc/food_bloc.dart';
import '../../../food/presentation/widgets/loading_widget.dart';
import '../../../food/presentation/widgets/snack_bar.dart';
import '../../domain/entities/user.dart';
import '../bloc/user_bloc.dart';
import '../widgets/input_filed.dart';

class ProfilePage extends StatelessWidget {
  // final User user;
  ProfilePage({super.key});
  // const ProfilePage(this.user, {super.key});
  final TextEditingController _fnameEditingController = TextEditingController();
  final TextEditingController _lnameEditingController = TextEditingController();
  final TextEditingController _usernameEditingController =
      TextEditingController();
  final TextEditingController _systolicEditingController =
      TextEditingController();
  final TextEditingController _diastolicEditingController =
      TextEditingController();
  final TextEditingController _pulseEditingController = TextEditingController();
  final TextEditingController _heightEditingController =
      TextEditingController();
  final TextEditingController _weightEditingController =
      TextEditingController();
  final TextEditingController _upperArmEditingController =
      TextEditingController();
  final TextEditingController _upperLegEditingController =
      TextEditingController();
  final TextEditingController _armCirEditingController =
      TextEditingController();
  final TextEditingController _hipCirEditingController =
      TextEditingController();
  final TextEditingController _waistCirEditingController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => serviceLocator<UserBloc>()
            ..add(GetSingleUserEvent(
                serviceLocator<CustomClient>().authToken ?? '')),
        ),
        BlocProvider(
          create: (context) =>
              serviceLocator<FoodBloc>()..add(LoadAllFoodsEvent()),
        ),
      ],
      child: BlocBuilder<UserBloc, UserState>(
        builder: (context, state) => buildBody(context, state),
      ),
    ));
  }

  Widget buildBody(BuildContext context, UserState state) {
    User? user;

    if (state is SingleUserLoadedState) {
      print('fffffffffffffffffff');
      user = state.user;
    }
    if (state is UserUpdatedState) {
      user = state.user;
    }

    if (user != null) {
      final h = mean_user_attributes['height'].toString();
      print(h);
      _fnameEditingController.text = user.firstName ?? '';
      _lnameEditingController.text = user.lastName ?? '';
      _usernameEditingController.text = user.username;
      _systolicEditingController.text =
          (user.systolic ?? mean_user_attributes['systolic']).toString();

      _diastolicEditingController.text =
          (user.diastolic ?? mean_user_attributes['diastolic']).toString();
      _pulseEditingController.text =
          (user.pulse ?? mean_user_attributes['pulse']).toString();
      _heightEditingController.text =
          (user.height ?? mean_user_attributes['height']).toString();
      _weightEditingController.text =
          (user.weight ?? mean_user_attributes['weight']).toString();
      _upperArmEditingController.text =
          (user.upperArmLength ?? mean_user_attributes['upperArmLength'])
              .toString();
      _upperLegEditingController.text =
          (user.upperLegLength ?? mean_user_attributes['upperLegLength'])
              .toString();
      _armCirEditingController.text =
          (user.armCircumference ?? mean_user_attributes['armCircumference'])
              .toString();

      _hipCirEditingController.text =
          mean_user_attributes['hipCircumference'].toString();
      _waistCirEditingController.text =
          mean_user_attributes['waistCircumference'].toString();
    } else {
      // _fnameEditingController.text =
      //     mean_user_attributes['firstName'].toString() ?? '';
      // _lnameEditingController.text =
      //     mean_user_attributes['lastName'].toString() ?? '';
      // _usernameEditingController.text =
      //     mean_user_attributes['username'].toString() ?? '';
      _systolicEditingController.text =
          mean_user_attributes['systolic'].toString();
      _diastolicEditingController.text =
          mean_user_attributes['diastolic'].toString();
      _pulseEditingController.text = mean_user_attributes['pulse'].toString();
      _heightEditingController.text = mean_user_attributes['height'].toString();
      _weightEditingController.text = mean_user_attributes['weight'].toString();
      _upperArmEditingController.text =
          mean_user_attributes['upperArmLength'].toString();
      _upperLegEditingController.text =
          mean_user_attributes['upperLegLength'].toString();
      _armCirEditingController.text =
          mean_user_attributes['armCircumference'].toString();
      _hipCirEditingController.text =
          mean_user_attributes['hipCircumference'].toString();
      _waistCirEditingController.text =
          mean_user_attributes['waistCircumference'].toString();
    }

    return SingleChildScrollView(
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
                    onPressed: () {
                      User newUser = User(
                        username: _usernameEditingController.text,
                        firstName: _fnameEditingController.text,
                        lastName: _lnameEditingController.text,
                        height: _heightEditingController.text.isNotEmpty
                            ? double.parse(_heightEditingController.text)
                            : mean_user_attributes['height']!,
                        weight: _weightEditingController.text.isNotEmpty
                            ? double.parse(_weightEditingController.text)
                            : mean_user_attributes['weight']!,
                        upperArmLength:
                            _upperArmEditingController.text.isNotEmpty
                                ? double.parse(_upperArmEditingController.text)
                                : mean_user_attributes['upper_arm_length']!,
                        upperLegLength:
                            _upperLegEditingController.text.isNotEmpty
                                ? double.parse(_upperLegEditingController.text)
                                : mean_user_attributes['upper_leg_length']!,
                        armCircumference:
                            _armCirEditingController.text.isNotEmpty
                                ? double.parse(_armCirEditingController.text)
                                : mean_user_attributes['arm_circumference']!,
                        hipCircumference:
                            _hipCirEditingController.text.isNotEmpty
                                ? double.parse(_hipCirEditingController.text)
                                : mean_user_attributes['hip_circumference']!,
                        waistCircumference:
                            _waistCirEditingController.text.isNotEmpty
                                ? double.parse(_waistCirEditingController.text)
                                : mean_user_attributes['waist_circumference']!,
                        systolic: _systolicEditingController.text.isNotEmpty
                            ? int.parse(_systolicEditingController.text)
                            : mean_user_attributes['systolic']!.toInt(),
                        diastolic: _diastolicEditingController.text.isNotEmpty
                            ? int.parse(_diastolicEditingController.text)
                            : mean_user_attributes['diastolic']!.toInt(),
                        pulse: _pulseEditingController.text.isNotEmpty
                            ? int.parse(_pulseEditingController.text)
                            : mean_user_attributes['pulse']!.toInt(),
                      );

                      BlocProvider.of<UserBloc>(context).add(UpdateUserEvent(
                          newUser,
                          serviceLocator<CustomClient>().authToken ?? ''));
                    },
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
            BlocConsumer<UserBloc, UserState>(
              listener: (context, state) {
                if (state is UserErrorState) {
                  showError(context, state.message);
                }
              },
              builder: (context, state) {
                if (state is UserLoadingState) {
                  print(7777777777777777);
                  return const LoadingWidget();
                } else if (state is SingleUserLoadedState ||
                    state is UserUpdatedState) {
                  print('hi');
                  print(user);
                  return Column(
                    children: [
                      CustomInputField('First Name', _fnameEditingController,
                          defaultValue: user?.firstName ?? ''),
                      CustomInputField('Last Name', _lnameEditingController,
                          defaultValue: user?.lastName ?? ''),
                      CustomInputField('Username', _usernameEditingController,
                          defaultValue: user?.username ?? ''),
                      CustomInputField('Height', _heightEditingController,
                          defaultValue: user?.height == null
                              ? mean_user_attributes['height']!.toString()
                              : user?.height.toString() ?? ''),
                      CustomInputField('Weight', _weightEditingController,
                          defaultValue: user?.weight == null
                              ? mean_user_attributes['Weight']!.toString()
                              : user?.weight.toString() ?? ''),
                      CustomInputField(
                          'Upper Arm Length', _upperArmEditingController,
                          defaultValue: user?.upperArmLength == null
                              ? mean_user_attributes['upper_arm_length']!
                                  .toString()
                              : user?.upperArmLength.toString() ?? ''),
                      CustomInputField(
                          'Upper Leg Length', _upperLegEditingController,
                          defaultValue: user?.upperLegLength == null
                              ? mean_user_attributes['upper_leg_length']!
                                  .toString()
                              : user?.upperLegLength.toString() ?? ''),
                      CustomInputField(
                          'Arm Circumference', _armCirEditingController,
                          defaultValue: user?.armCircumference == null
                              ? mean_user_attributes['arm_circumference']!
                                  .toString()
                              : user?.armCircumference.toString() ?? ''),
                      CustomInputField(
                          'Hip Circumference', _hipCirEditingController,
                          defaultValue: user?.hipCircumference == null
                              ? mean_user_attributes['hip_circumference']!
                                  .toString()
                              : user?.hipCircumference.toString() ?? ''),
                      CustomInputField(
                          'Waist Circumference', _waistCirEditingController,
                          defaultValue: user?.waistCircumference == null
                              ? mean_user_attributes['waist_circumference']!
                                  .toString()
                              : user?.waistCircumference.toString() ?? ''),
                      CustomInputField(
                          'Systolic Blood Pressure', _systolicEditingController,
                          defaultValue: user?.systolic == null
                              ? mean_user_attributes['systolic']!.toString()
                              : user?.systolic.toString() ?? ''),
                      CustomInputField('Diastolic Blood Pressure',
                          _diastolicEditingController,
                          defaultValue: user?.diastolic == null
                              ? mean_user_attributes['diastolic']!.toString()
                              : user?.diastolic.toString() ?? ''),
                      CustomInputField('Pulse Rate', _pulseEditingController,
                          defaultValue: user?.pulse == null
                              ? mean_user_attributes['pulse']!.toString()
                              : user?.pulse.toString() ?? ''),
                      SizedBox(
                        height: 40.h,
                      ),
                      Center(
                        child: SizedBox(
                            width: 200.w,
                            child: ElevatedButton(
                                onPressed: () {
                                  User newUser = User(
                                    username: _usernameEditingController.text,
                                    firstName: _fnameEditingController.text,
                                    lastName: _lnameEditingController.text,
                                    height:
                                        _heightEditingController.text.isNotEmpty
                                            ? double.parse(
                                                _heightEditingController.text)
                                            : mean_user_attributes['height']!,
                                    weight:
                                        _weightEditingController.text.isNotEmpty
                                            ? double.parse(
                                                _weightEditingController.text)
                                            : mean_user_attributes['weight']!,
                                    upperArmLength: _upperArmEditingController
                                            .text.isNotEmpty
                                        ? double.parse(
                                            _upperArmEditingController.text)
                                        : mean_user_attributes[
                                            'upper_arm_length']!,
                                    upperLegLength: _upperLegEditingController
                                            .text.isNotEmpty
                                        ? double.parse(
                                            _upperLegEditingController.text)
                                        : mean_user_attributes[
                                            'upper_leg_length']!,
                                    armCircumference:
                                        _armCirEditingController.text.isNotEmpty
                                            ? double.parse(
                                                _armCirEditingController.text)
                                            : mean_user_attributes[
                                                'arm_circumference']!,
                                    hipCircumference:
                                        _hipCirEditingController.text.isNotEmpty
                                            ? double.parse(
                                                _hipCirEditingController.text)
                                            : mean_user_attributes[
                                                'hip_circumference']!,
                                    waistCircumference:
                                        _waistCirEditingController
                                                .text.isNotEmpty
                                            ? double.parse(
                                                _waistCirEditingController.text)
                                            : mean_user_attributes[
                                                'waist_circumference']!,
                                    systolic: _systolicEditingController
                                            .text.isNotEmpty
                                        ? int.parse(
                                            _systolicEditingController.text)
                                        : mean_user_attributes['systolic']!
                                            .toInt(),
                                    diastolic: _diastolicEditingController
                                            .text.isNotEmpty
                                        ? int.parse(
                                            _diastolicEditingController.text)
                                        : mean_user_attributes['diastolic']!
                                            .toInt(),
                                    pulse:
                                        _pulseEditingController.text.isNotEmpty
                                            ? int.parse(
                                                _pulseEditingController.text)
                                            : mean_user_attributes['pulse']!
                                                .toInt(),
                                  );

                                  BlocProvider.of<UserBloc>(context).add(
                                      UpdateUserEvent(
                                          newUser,
                                          serviceLocator<CustomClient>()
                                                  .authToken ??
                                              ''));
                                },
                                child: const Text('Save Changes'))),
                      ),
                      SizedBox(
                        height: 40.h,
                      ),
                    ],
                  );
                }

                return const LoadingWidget();
              },
            ),
          ])),
    );
  }
}
