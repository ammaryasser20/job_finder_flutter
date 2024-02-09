import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gp/controller/jobscubit/jobs_cubit.dart';
import 'package:gp/controller/navigationcubit/navigation_cubit.dart';
import 'package:gp/controller/onboardingcubit/on_boarding_cubit.dart';
import 'package:gp/controller/searchcubit/search_cubit.dart';
import 'package:gp/controller/textfieldcubit/text_field_cubit.dart';
import 'package:gp/controller/usercubit/user_cubit.dart';
import 'package:gp/core/serves/cash_helper.dart';
import 'package:gp/core/serves/dio_helper.dart';
import 'package:gp/core/uitlites/app_route.dart';
import 'package:gp/core/uitlites/route.dart';
import 'package:gp/core/uitlites/theme_app.dart';

import 'package:sizer/sizer.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await CashHelper.init();
  await DioHelper.init();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(create: (_) => UserCubit()),
          BlocProvider(create: (_) => OnBoardingCubit()),
          BlocProvider(create: (_) => TextFieldCubit()),
          BlocProvider(create: (_) => NavigationCubit()),
          BlocProvider(create: (_) => SearchCubit()),
          BlocProvider(create: (_) => JobsCubit()),
          BlocProvider(create: (_) => SearchCubit())
        ],
        child: Sizer(
          builder: (BuildContext context, Orientation orientation,
              DeviceType deviceType) {
            return MaterialApp(
              navigatorKey: NavigationService.navigatorKey,
              debugShowCheckedModeBanner: false,
              theme: Themes.lightTheme, //ThemeData(fontFamily: 'SF-Pro',),
              onGenerateRoute: onGenerateRoute,
              initialRoute: AppRoute.splashScreen,
            );
          },
        ));
  }
}

class NavigationService {
  static GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
}
