import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gp/controller/jobscubit/jobs_cubit.dart';

import 'package:gp/controller/usercubit/user_cubit.dart';
import 'package:gp/core/uitlites/app_route.dart';
import 'package:gp/core/uitlites/app_theme_class.dart';
import 'package:gp/core/uitlites/enums.dart';
import 'package:gp/core/local/db.dart';
import 'package:gp/core/serves/cash_helper.dart';
import 'package:gp/main.dart';
import 'package:gp/view/pages/complete_profile/complete_Profile.dart';
import 'package:gp/view/pages/navigationscreens/profile/general/general_item.dart';
import 'package:gp/view/pages/navigationscreens/profile/others/other.dart';
import 'package:sizer/sizer.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppTheme.primaryColors[100],
        centerTitle: true,
        title: const Text('Profile'),
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 5.w),
            child: InkWell(
                onTap: () async {
                  UserCubit.get(context).logout();
                  JobsCubit.get(context).clear();
                  Navigator.pushNamedAndRemoveUntil(
                      NavigationService.navigatorKey.currentContext!,
                      AppRoute.loginScreen,
                      (route) => false);
                  MyDataBase dB = MyDataBase();
                  await dB.clear();
                  await CashHelper.logout();
                },
                child: SvgPicture.asset('assets/images/logout.svg')),
          )
        ],
      ),
      body: BlocBuilder<UserCubit, UserState>(
        builder: (context, state) {
          if (UserState == LogInLoading ||
              UserState == RegisterSuccessful ||
              UserState == GetProfileSuccessful) {
            return const CircularProgressIndicator();
          } else {
            return ListView(
              children: [
                Stack(clipBehavior: Clip.none, children: [
                  Container(
                    width: 100.w,
                    height: 15.h,
                    color: AppTheme.primaryColors[100],
                  ),
                  Positioned(
                    top: 7.h,
                    left: 50.w - 50,
                    child: CircleAvatar(
                      backgroundColor: Colors.white,
                      radius: 50,
                      backgroundImage: AssetImage(
                          CashHelper.getString(key: Keys.photo).isNotEmpty
                              ? CashHelper.getString(key: Keys.photo)
                              : 'assets/images/Profile.png'),
                    ),
                  )
                ]),
                const SizedBox(
                  height: 40,
                ),
                Center(
                  child: InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const CompleteProfile()));
                    },
                    child: Text(
                      UserCubit.get(context).user!.name!,
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                  ),
                ),
                Center(
                  child: Text(
                    CashHelper.getString(key: Keys.bio).isNotEmpty
                        ? CashHelper.getString(key: Keys.bio)
                        : '-----No bio-----',
                    style: Theme.of(context).textTheme.displayMedium,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 2.h, horizontal: 5.w),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: const Color.fromRGBO(250, 250, 250, 1),
                    ),
                    padding: const EdgeInsets.all(10),
                    child: IntrinsicHeight(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Column(
                            children: [
                              Text(
                                'Applied',
                                style: Theme.of(context)
                                    .textTheme
                                    .displayMedium!
                                    .copyWith(
                                        fontWeight: AppTheme.mediumWeight,
                                        color: AppTheme.neutralColors),
                              ),
                              SizedBox(
                                height: 3,
                              ),
                              Text(
                                '48',
                                style: Theme.of(context).textTheme.titleLarge!,
                              ),
                            ],
                          ),
                          VerticalDivider(
                            color: AppTheme.neutralColors[300],
                          ),
                          Column(
                            children: [
                              Text(
                                'Reviewed',
                                style: Theme.of(context)
                                    .textTheme
                                    .displayMedium!
                                    .copyWith(
                                        fontWeight: AppTheme.mediumWeight,
                                        color: AppTheme.neutralColors),
                              ),
                              SizedBox(
                                height: 3,
                              ),
                              Text(
                                '23',
                                style: Theme.of(context).textTheme.titleLarge!,
                              ),
                            ],
                          ),
                          VerticalDivider(
                            color: AppTheme.neutralColors[300],
                          ),
                          Column(
                            children: [
                              Text(
                                'Contacted',
                                style: Theme.of(context)
                                    .textTheme
                                    .displayMedium!
                                    .copyWith(
                                        fontWeight: AppTheme.mediumWeight,
                                        color: AppTheme.neutralColors),
                              ),
                              SizedBox(
                                height: 3,
                              ),
                              Text(
                                '16',
                                style: Theme.of(context).textTheme.titleLarge!,
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 1.h, left: 5.w),
                  child: Row(
                    children: [
                      Text(
                        'About',
                        style: Theme.of(context)
                            .textTheme
                            .displayLarge!
                            .copyWith(fontWeight: AppTheme.mediumWeight),
                      ),
                      const Spacer(),
                      TextButton(
                        onPressed: () {},
                        child: Text(
                          'Edit',
                          style: Theme.of(context)
                              .textTheme
                              .displayMedium!
                              .copyWith(color: AppTheme.primaryColors),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 5.w),
                  child: Text(
                    'I\'m Rafif Dian Axelingga, I’m UI/UX Designer, I have experience designing UI Design for approximately 1 year. I am currently joining the Vektora studio team based in Surakarta, Indonesia.I am a person who has a high spirit and likes to work to achieve what I dream of.',
                    style: Theme.of(context)
                        .textTheme
                        .displayMedium!
                        .copyWith(color: AppTheme.neutralColors),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                const General(),
                const Other()
              ],
            );
          }
        },
      ),
    );
  }
}
