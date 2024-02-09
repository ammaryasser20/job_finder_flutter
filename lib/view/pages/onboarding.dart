import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gp/const.dart';
import 'package:gp/controller/onboardingcubit/on_boarding_cubit.dart';
import 'package:gp/core/uitlites/app_route.dart';
import 'package:gp/core/uitlites/app_theme_class.dart';
import 'package:gp/core/uitlites/enums.dart';
import 'package:gp/core/serves/cash_helper.dart';
import 'package:gp/view/widget/default_bottom.dart';
import 'package:sizer/sizer.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  late PageController pageController;
  @override
  void initState() {
    CashHelper.putBool(key: Keys.notFirstTime, value: true);
    pageController = PageController(initialPage: 0);
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Column(children: [
        Padding(
          padding: const EdgeInsets.only(left: 24, right: 24, top: 15),
          child: Row(
            children: [
              SvgPicture.asset(
                "assets/images/Logo.svg",
                width: 25.w,
              ),
              const Spacer(),
              TextButton(
                  onPressed: () {
                    Navigator.pushNamed(context, AppRoute.createAccount);
                  },
                  child: Text("Skip",
                      style: Theme.of(context).textTheme.displayLarge))
            ],
          ),
        ),
        Expanded(
          child: PageView.builder(
              onPageChanged: (value) {
                OnBoardingCubit.get(context).changeConter(value);
              },
              controller: pageController,
              itemCount: 3,
              itemBuilder: (cotext, i) {
                return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Image.asset(
                        "assets/images/Background$i.jpg",
                        width: 100.w,
                        height: 40.h,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 24, left: 24),
                        child: onText[i],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 24, top: 12),
                        child: Text(tittle[i],
                            style: Theme.of(context).textTheme.displayLarge),
                      ),
                    ]);
              }),
        ),
        SizedBox(
          height: 5.h,
        ),
        SmoothPageIndicator(
          controller: pageController,
          count: 3,
          effect: ScrollingDotsEffect(
              spacing: 3,
              dotHeight: 6,
              dotWidth: 6,
              strokeWidth: 1.5,
              dotColor: AppTheme.primaryColors[200]!,
              activeDotColor: Theme.of(context).primaryColor),
        ),
        SizedBox(
          height: 5.h,
        ),
        BlocBuilder<OnBoardingCubit, OnBoardingState>(
          builder: (context, state) {
            return DefaultBottoom(
                text: OnBoardingCubit.get(context).counter != 2
                    ? "Next"
                    : "Get Started",
                function: OnBoardingCubit.get(context).counter != 2
                    ? () {
                        pageController.nextPage(
                            duration: const Duration(milliseconds: 500),
                            curve: Curves.ease);
                      }
                    : () {
                        Navigator.pushNamed(context, AppRoute.createAccount);
                      });
          },
        ),
        SizedBox(
          height: 5.h,
        )
      ]),
    ));
  }
}
