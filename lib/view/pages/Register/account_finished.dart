import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gp/core/uitlites/app_route.dart';
import 'package:gp/view/widget/default_bottom.dart';
import 'package:sizer/sizer.dart';

class AccountDone extends StatelessWidget {
  const AccountDone({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(5.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: const Icon(
                  Icons.arrow_back,
                ),
              ),
              SizedBox(
                height: 20.h,
              ),
              Center(
                child: SvgPicture.asset(
                    "assets/images/Success Account Ilustration.svg"),
              ),
              SizedBox(
                height: 5.h,
              ),
              Center(
                child: Text(
                  "Your account has been set up!",
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
              ),
              SizedBox(
                height: 1.h,
              ),
              Center(
                child: Text(
                    "We have customized feeds according to your\npreferences",
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.displayMedium),
              ),
              const Spacer(),
              Center(
                child: DefaultBottoom(
                  text: "Get Started",
                  function: () {
                    Navigator.pushReplacementNamed(
                        context, AppRoute.navigationScreens);
                  },
                ),
              ),
              SizedBox(
                height: 2.h,
              )
            ],
          ),
        ),
      ),
    );
  }
}
