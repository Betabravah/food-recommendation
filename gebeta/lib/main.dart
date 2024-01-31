import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'core/injection/dependency_injection.dart' as di;
import 'core/presentation/route/router.dart';
import 'core/theme/app_theme.dart';
import 'features/auth/presentation/bloc/auth_bloc.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await di.init();
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(430, 932),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (_, child) => MultiBlocProvider(
              providers: [
                BlocProvider<AuthBloc>(
                  create: (_) =>
                      di.serviceLocator<AuthBloc>()..add(GetTokenEvent()),
                ),
              ],
              child: MaterialApp.router(
                title: 'Gebeta',
                theme: AppTheme.themeData,
                debugShowCheckedModeBanner: false,
                routerConfig: router,
              ),
            ));
  }
}
