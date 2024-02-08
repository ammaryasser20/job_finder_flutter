import 'package:flutter/material.dart';
import 'package:gp/controller/usercubit/user_cubit.dart';
import 'package:gp/core/uitlites/app_route.dart';
import 'package:gp/core/uitlites/app_theme_class.dart';
import 'package:sizer/sizer.dart';

class LoginAndSecurity extends StatelessWidget {
  const LoginAndSecurity({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_rounded),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        centerTitle: true,
        title: const Text('Login and security'),
      ),
      body: Column(
        children: [
          SizedBox(
            height: 3.h,
          ),
          Container(
            width: 100.w,
            padding: const EdgeInsets.only(left: 10, top: 5, bottom: 5),
            decoration: BoxDecoration(
              color: AppTheme.neutralColors[100],
              border: Border.symmetric(
                horizontal: BorderSide(
                  color: AppTheme.neutralColors[200]!,
                ),
              ),
            ),
            child: Text(
              "Accont access",
              style: Theme.of(context).textTheme.displayMedium!.copyWith(
                    color: AppTheme.neutralColors,
                    fontWeight: AppTheme.mediumWeight,
                  ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 1.h),
              child: ListView.separated(
                itemCount: loginAndSecurity.length,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      Navigator.pushNamed(
                          context, navigatorListForSecurity[index]);
                    },
                    child: Padding(
                      padding: EdgeInsets.symmetric(vertical: 1.h),
                      child: Row(
                        children: [
                          const SizedBox(
                            width: 10,
                          ),
                          Text(
                            loginAndSecurity[index],
                            style: Theme.of(context)
                                .textTheme
                                .displayLarge!
                                .copyWith(
                                  color: AppTheme.neutralColors[900],
                                ),
                          ),
                          const Spacer(),
                          if (loginAndSecurity[index] == 'Email address')
                            Text(UserCubit.get(context).user!.email!,
                                style:
                                    Theme.of(context).textTheme.displayMedium),
                          if (loginAndSecurity[index] ==
                              'Two-step verification')
                            Text(
                              'Non active',
                              style: Theme.of(context).textTheme.displayMedium,
                            ),
                          const SizedBox(
                            width: 10,
                          ),
                          const Icon(Icons.arrow_forward)
                        ],
                      ),
                    ),
                  );
                },
                separatorBuilder: (BuildContext context, int index) {
                  return Divider(
                    color: AppTheme.neutralColors[300],
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}

List<String> loginAndSecurity = [
  'Email address',
  'Phone number',
  'Change password',
  'Two-step verification',
  'Face ID',
];
List<String> navigatorListForSecurity = [
  AppRoute.emailEdit,
  AppRoute.changePhone,
  AppRoute.changePassword,
  AppRoute.twoStepVerification,
  AppRoute.faceID,
];
