import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/constants/constants.dart';
import '../../../../core/injection/dependency_injection.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../user/presentation/screens/profile_page.dart';
import '../../domain/entities/food.dart';
import '../bloc/food_bloc.dart';
import '../widgets/custom_search_bar.dart';
import '../widgets/display_card.dart';
import '../widgets/food_list.dart';
import '../widgets/loading_widget.dart';
import '../widgets/profile_avatar.dart';
import '../widgets/snack_bar.dart';

class HomePage extends StatefulWidget {
  // final List<Food> foods;
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: true, // Add this line
        body: MultiBlocProvider(
          providers: [
            BlocProvider(
              create: (context) =>
                  serviceLocator<FoodBloc>()..add(LoadAllFoodsEvent()),
            ),
          ],
          child: BlocBuilder<FoodBloc, FoodState>(
            builder: (context, _) => buildBody(context),
          ),
        ));
  }

  Widget buildBody(BuildContext context) {
    return SingleChildScrollView(
      // Wrap Column with SingleChildScrollView
      child: Container(
        padding: EdgeInsets.only(top: 50.h, left: 16.w, right: 16.w),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            const Text(
              'Hello👋',
              style: TextStyle(fontSize: 40, fontFamily: 'Poppins'),
            ),
            GestureDetector(
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      const ProfilePage(), // Pass food to FoodDetail
                ),
              ).then((e) =>
                  BlocProvider.of<FoodBloc>(context).add(LoadAllFoodsEvent())),
              child: const ProfileAvatar(
                  image:
                      'https://images.unsplash.com/photo-1494790108377-be9c29b29330?q=80&w=1887&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D'),
            )
          ]),
          const CustomSearchBar(),
          SizedBox(
            height: 15.h,
          ),
          const DisplayCard(),
          SizedBox(
            height: 30.h,
          ),
          const Text(
            'Recommended Foods',
            style: TextStyle(fontSize: 20, color: AppColors.purple),
          ),
          BlocConsumer<FoodBloc, FoodState>(
            listener: (context, state) {
              if (state is FoodErrorState) {
                showError(context, state.message);
              }
            },
            builder: (context, state) {
              if (state is FoodLoadingState) {
                return const LoadingWidget();
              } else if (state is AllFoodsFilteredState) {
                return FoodList(state.foods);
              } else if (state is AllFoodsLoadedState) {
                return FoodList(state.foods);
              }

              return const LoadingWidget();
            },
          ),
          // Removed SingleChildScrollView from here
        ]),
      ),
    );
  }
}
