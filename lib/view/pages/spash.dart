import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:awesome_ripple_animation/awesome_ripple_animation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gp/controller/usercubit/user_cubit.dart';
import 'package:gp/core/uitlites/enums.dart';
import 'package:gp/core/serves/cash_helper.dart';
import 'package:gp/view/pages/navigationscreens/navigation_screens.dart';
import 'package:gp/view/pages/login_screen.dart';
import 'package:gp/view/pages/onboarding.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  @override
  void didChangeDependencies() async {
 
    super.didChangeDependencies();
    if (CashHelper.getString(key: Keys.tokenKey) != '') {
      await UserCubit.get(context)
          .getProfile(CashHelper.getString(key: Keys.tokenKey));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimatedSplashScreen(
        splash: RippleAnimation(
            size: const Size(141, 33),
   
            ripplesCount: 3,
            color: Colors.blue,
            minRadius: 120,
            child: SvgPicture.asset("assets/images/Logo.svg")),
        nextScreen:
         CashHelper.getBool(key: Keys.notFirstTime)
                ? CashHelper.getString(key: Keys.tokenKey) != ''
                    ? const NavigationScreens()
                    : const LoginScreen()
               :
            const OnboardingScreen(),
      ),
    );
  }
}
