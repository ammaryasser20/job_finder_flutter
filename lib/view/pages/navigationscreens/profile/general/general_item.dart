import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gp/core/uitlites/app_route.dart';
import 'package:gp/core/uitlites/app_theme_class.dart';
import 'package:sizer/sizer.dart';

class General extends StatelessWidget {
  const General({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
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
            "General",
            style: Theme.of(context).textTheme.displayMedium!.copyWith(
                  color: AppTheme.neutralColors,
                  fontWeight: AppTheme.mediumWeight,
                ),
          ),
        ),
        ListView.separated(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: generalList.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 1.h),
              child: InkWell(
                onTap: () {
                  Navigator.pushNamed(context, navigatorList[index]);
                },
                child: Row(
                  children: [
                    SvgPicture.asset(
                      'assets/images/profilesetting/${generalList[index]}.svg',
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Text(
                      generalList[index],
                      style: Theme.of(context).textTheme.displayLarge!.copyWith(
                            color: AppTheme.neutralColors[900],
                          ),
                    ),
                    const Spacer(),
                    const Icon(Icons.arrow_forward_sharp)
                  ],
                ),
              ),
            );
          },
          separatorBuilder: (BuildContext context, int index) {
            return Divider(
              color: AppTheme.neutralColors[200],
              indent: 5.w,
              endIndent: 5.w,
            );
          },
        ),
        Divider(
          color: AppTheme.neutralColors[200],
          indent: 5.w,
          endIndent: 5.w,
        ),
        SizedBox(
          height: 2.h,
        ),
      ],
    );
  }
}

List<String> navigatorList = [
  AppRoute.editProfile,
  AppRoute.portfolio,
  AppRoute.language,
  AppRoute.notificationSetting,
  AppRoute.loginAndSecurity,
];

List<String> generalList = [
  'Edit Profile',
  'Portfolio',
  'Langauge',
  'Notification',
  'Login and security'
];
