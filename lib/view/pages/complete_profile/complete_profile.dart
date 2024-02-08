import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gp/controller/usercubit/user_cubit.dart';
import 'package:gp/core/uitlites/app_theme_class.dart';
import 'package:gp/view/pages/complete_profile/complete_portfolio.dart';
import 'package:gp/view/pages/complete_profile/education.dart';
import 'package:gp/view/pages/complete_profile/experience.dart';
import 'package:gp/view/pages/complete_profile/personal_details.dart';

import 'package:simple_circular_progress_bar/simple_circular_progress_bar.dart';
import 'package:sizer/sizer.dart';

class CompleteProfile extends StatefulWidget {
  const CompleteProfile({super.key});

  @override
  State<CompleteProfile> createState() => _CompleteProfileState();
}

class _CompleteProfileState extends State<CompleteProfile> {
  late ValueNotifier<double> valueNotifier;
  double num = 0;
  @override
  void initState() {
    super.initState();

    if (UserCubit.get(context).userInfo!.allInfo!.portfolio != null) {
      if (UserCubit.get(context).userInfo!.allInfo!.portfolio!.isNotEmpty) {
        UserCubit.get(context).competetStep(step: 3, value: 1);
      }
    }
    UserCubit.get(context).profileCompleting.forEach(
      (element) {
        num = num + 25 * element;
      },
    );
    valueNotifier = ValueNotifier<double>(num);
  }

  changeNotifier(BuildContext context) {
    num = 0;
    UserCubit.get(context).profileCompleting.forEach(
      (element) {
        num = num + 25 * element;
      },
    );
    valueNotifier = ValueNotifier<double>(num);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserCubit, UserState>(
      builder: (context, state) {
        num = 0;
        UserCubit.get(context).profileCompleting.forEach(
          (element) {
            num = num + 25 * element;
          },
        );
        valueNotifier.value = num;
        return Scaffold(
          appBar: AppBar(
            leading: IconButton(
              icon: const Icon(Icons.arrow_back),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            centerTitle: true,
            title: const Text('Complete Profile'),
          ),
          body: Padding(
            padding: EdgeInsets.symmetric(horizontal: 5.w),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const SizedBox(
                    height: 40,
                  ),
                  Center(
                    child: SimpleCircularProgressBar(
                      progressColors: const [AppTheme.primaryColors],
                      progressStrokeWidth: 7,
                      backStrokeWidth: 7,
                      backColor: AppTheme.neutralColors[200]!,
                      valueNotifier: valueNotifier,
                      mergeMode: true,
                      onGetText: (double value) {
                        TextStyle centerTextStyle = Theme.of(context)
                            .textTheme
                            .headlineSmall!
                            .copyWith(color: AppTheme.primaryColors);

                        return Text(
                          '${value.toInt()}%',
                          style: centerTextStyle,
                        );
                      },
                    ),
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  Text(
                    num != 100
                        ? '${((num / 100) * 4).toInt()}/4 Completed'
                        : 'Completed!',
                    style: Theme.of(context).textTheme.displayLarge!.copyWith(
                        color: AppTheme.primaryColors,
                        fontWeight: AppTheme.mediumWeight),
                  ),
                  SizedBox(
                    height: 1.h,
                  ),
                  Text('Complete your profile before applying for a job',
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.displayLarge),
                  const SizedBox(
                    height: 30,
                  ),
                  InkWell(
                    borderRadius: BorderRadius.circular(8),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => PersonalDetails(),
                        ),
                      );
                    },
                    child: const ProfileCard(
                      title: 'Personal Details',
                      subTitle:
                          'Full name, email, phone number, and your address',
                      index: 0,
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  InkWell(
                    borderRadius: BorderRadius.circular(8),
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const Education()));
                    },
                    child: const ProfileCard(
                      title: 'Education',
                      subTitle:
                          'Enter your educational history to be considered by the recruiter',
                      index: 1,
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  InkWell(
                    borderRadius: BorderRadius.circular(8),
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const Experience()));
                    },
                    child: const ProfileCard(
                      title: 'Experience',
                      subTitle:
                          'Enter your work experience to be considered by the recruiter',
                      index: 2,
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  InkWell(
                    borderRadius: BorderRadius.circular(8),
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const CompletePortfolio()));
                    },
                    child: const ProfileCard(
                      title: 'Portfolio ',
                      subTitle:
                          'Create your portfolio. Applying for various types of jobs is easier.',
                      index: 3,
                    ),
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

class ProfileCard extends StatelessWidget {
  const ProfileCard(
      {super.key,
      required this.title,
      required this.subTitle,
      required this.index});
  final String title;
  final String subTitle;
  final int index;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserCubit, UserState>(
      builder: (context, state) {
        return Container(
          padding: EdgeInsets.symmetric(vertical: 1.5.h),
          decoration: BoxDecoration(
              color: UserCubit.get(context).profileCompleting[index] == 0
                  ? null
                  : AppTheme.primaryColors[100],
              border: Border.all(
                  color: UserCubit.get(context).profileCompleting[index] == 0
                      ? Colors.grey
                      : AppTheme.primaryColors),
              borderRadius: BorderRadius.circular(8)),
          child: ListTile(
            leading: SvgPicture.asset(
                UserCubit.get(context).profileCompleting[index] == 0
                    ? 'assets/images/uncompletstep.svg'
                    : 'assets/images/completstep.svg'),
            title: Padding(
              padding: const EdgeInsets.only(bottom: 4.0),
              child: Text(
                title,
                style: Theme.of(context).textTheme.displayLarge!.copyWith(
                      fontWeight: AppTheme.mediumWeight,
                      color: AppTheme.neutralColors[900],
                    ),
              ),
            ),
            subtitle: Text(
              subTitle,
              style: Theme.of(context).textTheme.displaySmall!.copyWith(
                    color: AppTheme.neutralColors[500],
                  ),
            ),
            trailing: const Icon(Icons.arrow_forward_rounded),
          ),
        );
      },
    );
  }
}
