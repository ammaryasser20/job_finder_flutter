import 'package:flutter/material.dart';
import 'package:gp/const.dart';
import 'package:gp/core/uitlites/app_route.dart';
import 'package:gp/core/uitlites/app_theme_class.dart';
import 'package:gp/view/widget/default_bottom.dart';
import 'package:sizer/sizer.dart';
import 'package:toggle_switch/toggle_switch.dart';
import '../../widget/countries_item.dart';

class WayOfWork extends StatefulWidget {
  const WayOfWork({super.key});

  @override
  State<WayOfWork> createState() => _WayOfWorkState();
}

class _WayOfWorkState extends State<WayOfWork> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(4.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Where are you preferred Location?",
                style: Theme.of(context).textTheme.headlineSmall,
              ),
              SizedBox(
                height: 2.h,
              ),
              Text(
                  "Let us know, where is the work location you want at this time, so we can adjust it.",
                  style: Theme.of(context).textTheme.displayLarge),
              SizedBox(
                height: 5.h,
              ), // Here, default theme colors are used for activeBgColor, activeFgColor, inactiveBgColor and inactiveFgColor
              ToggleSwitch(
                minWidth: 50.w,
                initialLabelIndex: 0,
                cornerRadius: 20.0,
                totalSwitches: 2,
                inactiveBgColor: AppTheme.neutralColors[100],
                activeBgColor: [AppTheme.primaryColors[900]!],
                radiusStyle: true,
                labels: const ['Work From Office', 'Remote Work'],
                onToggle: (index) {},
              ),
              SizedBox(height: 3.h),
              Text(
                "Select the country you want for your job",
                style: Theme.of(context).textTheme.displayLarge,
              ),
              SizedBox(height: 1.h),
              Wrap(
                children: [
                  ...countriesNames.map((e) => CountrieItem(
                        country: e,
                      ))
                ],
              ),
              SizedBox(height: 15.h),
              Center(
                  child: DefaultBottoom(
                      text: "Next",
                      function: () {
                        Navigator.pushNamed(context, AppRoute.accountDone);
                      }))
            ],
          ),
        ),
      ),
    );
  }
}
