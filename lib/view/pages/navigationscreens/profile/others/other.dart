import 'package:flutter/material.dart';
import 'package:gp/core/uitlites/app_route.dart';
import 'package:gp/core/uitlites/app_theme_class.dart';

import 'package:sizer/sizer.dart';

class Other extends StatelessWidget {
  const Other({super.key});

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
            "Others",
            style: Theme.of(context).textTheme.displayMedium!.copyWith(
                  color: AppTheme.neutralColors,
                  fontWeight: AppTheme.mediumWeight,
                ),
          ),
        ),
        SizedBox(
          height: 2.h,
        ),
        ListView.separated(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: othersList.length,
          itemBuilder: (con, index) {
            return InkWell(
              onTap: () {
                if (index != 0) {
                  Navigator.pushNamed(context, othersNavigator[index]);
                }
              },
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 1.h),
                child: Row(
                  children: [
                    Text(
                      othersList[index],
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
        const SizedBox(
          height: 20,
        )
      ],
    );
  }
}

List<String> othersList = [
  'Accesibility',
  'Help Center',
  'Terms & Conditions',
  'Privacy Policy'
];
List<String> othersNavigator = [
  '1',
  AppRoute.helpCenter,
  AppRoute.tremsAndConditions,
  AppRoute.privacyPolicy
];
