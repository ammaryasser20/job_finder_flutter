import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gp/controller/navigationcubit/navigation_cubit.dart';
import 'package:gp/core/uitlites/app_route.dart';
import 'package:gp/main.dart';

import 'package:gp/view/widget/default_bottom.dart';
import 'package:sizer/sizer.dart';

class SuccessfullyAppledJob extends StatelessWidget {
  const SuccessfullyAppledJob({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:
            Text('Apply Job', style: Theme.of(context).textTheme.titleLarge!),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pushNamedAndRemoveUntil(
                NavigationService.navigatorKey.currentContext!,
                AppRoute.navigationScreens,
                (route) => false);
          },
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 20.h,
            ),
            SvgPicture.asset('assets/images/successfully sent data.svg'),
            SizedBox(
              height: 2.h,
            ),
            Text(
              'Your data has been\nsuccessfully sent',
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            SizedBox(
              height: 1.h,
            ),
            Text(
              'You will get a message from our team, about\nthe announcement of employee acceptance',
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.displayLarge,
            ),
            const Spacer(),
            DefaultBottoom(
                text: 'Back to home',
                function: () {
                  NavigationCubit.get(context).changeIndex(newIndex: 0);
                  Navigator.pushNamedAndRemoveUntil(
                      context, AppRoute.navigationScreens, (route) => false);
                }),
            SizedBox(
              height: 2.h,
            ),
          ],
        ),
      ),
    );
  }
}
