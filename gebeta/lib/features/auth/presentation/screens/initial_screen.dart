
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/injection/dependency_injection.dart';
import '../../../../core/presentation/route/routes.dart';
import '../../../user/presentation/bloc/user_bloc.dart';
import '../bloc/auth_bloc.dart';
import 'splash_screen.dart';

class AppInitialScreen extends StatelessWidget {
  const AppInitialScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<UserBloc>(
      create: (context) => serviceLocator<UserBloc>(),

      //
      child: BlocListener<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is UserAuthState) {
            if (state.token != null) {
              context.read<UserBloc>().add(GetSingleUserEvent(state.token!));
            } else {
              context.go(Routes.splash);
            }
          }
        },
        child: BlocListener<UserBloc, UserState>(
          listener: (context, state) {
            if (state is SingleUserLoadedState) {
              print('User is loaded');
              context.go(Routes.home);
            } else if (state is UserErrorState) {
              context.go(Routes.splash);
            }
          },
          child: const SplashScreen(),
        ),
      ),
    );
  }
}
