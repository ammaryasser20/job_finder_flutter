import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gp/const.dart';
import 'package:gp/controller/jobscubit/jobs_cubit.dart';
import 'package:gp/controller/usercubit/user_cubit.dart';
import 'package:gp/core/uitlites/app_route.dart';
import 'package:gp/core/uitlites/app_theme_class.dart';

import 'package:gp/view/pages/notification.dart';
import 'package:gp/view/widget/job_items.dart';
import 'package:gp/view/widget/recent_job_item.dart';
import 'package:gp/view/widget/search_filed.dart';
import 'package:sizer/sizer.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.miniEndTop,
      floatingActionButton: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SizedBox(
          width: 50,
          height: 50,
          child: FloatingActionButton(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const NotificationApp()));
            },
            elevation: 0,
            foregroundColor: Colors.amber,
            backgroundColor: Colors.white,
            child: SvgPicture.asset("assets/images/notification.svg"),
            shape: RoundedRectangleBorder(
                side: BorderSide(color: AppTheme.neutralColors[300]!),
                borderRadius: BorderRadius.circular(100)),
          ),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 5.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 2.h,
              ),
              BlocBuilder<UserCubit, UserState>(
                builder: (context, state) {
                  if (UserState == LogInLoading ||
                      UserState == RegisterSuccessful ||
                      UserState == GetProfileSuccessful) {
                    return const CircularProgressIndicator();
                  } else {
                    return Text("Hi, ${UserCubit.get(context).user!.name}👋",
                        style: Theme.of(context).textTheme.headlineSmall);
                  }
                },
              ),
              SizedBox(
                height: 1.h,
              ),
              Text("Create a better future for yourself here",
                  style: Theme.of(context)
                      .textTheme
                      .displayMedium!
                      .copyWith(fontWeight: AppTheme.mediumWeight)),
              SizedBox(height: 4.h),
              Center(
                child: Searchfiled(
                  onSubmitted: (_) {},
                  hintText: "Search....",
                  controller: searchCon,
                  onTap: () {
                    Navigator.pushNamed(context, AppRoute.searchScreen);
                  },
                  readOnly: true,
                  height: 50,
                  width: 90.w,
                ),
              ),
              SizedBox(
                height: 1.h,
              ),
              Row(
                children: [
                  Text(
                    'Suggested Job',
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  const Spacer(),
                  TextButton(
                      onPressed: () {},
                      child: Text(
                        "View all",
                        style: Theme.of(context)
                            .textTheme
                            .displayMedium!
                            .copyWith(color: AppTheme.primaryColors),
                      ))
                ],
              ),
              BlocBuilder<JobsCubit, JobsState>(
                builder: (context, state) {
                  if (JobsState == LoadingAllJob ||
                      JobsState == GetAllApplyJob) {
                    return const CircularProgressIndicator();
                  } else {
                    return SizedBox(
                      height: 25.h,
                      child: ListView.builder(
                        itemBuilder: (context, i) {
                          return JobItem(
                            job: JobsCubit.get(context).jobs[i],
                          );
                        },
                        scrollDirection: Axis.horizontal,
                        itemCount: JobsCubit.get(context).jobs.length,
                      ),
                    );
                  }
                },
              ),
              BlocBuilder<JobsCubit, JobsState>(
                builder: (context, state) {
                  if (JobsCubit.get(context).recentJob.isNotEmpty) {
                    return Expanded(
                      child: Column(
                        children: [
                          SizedBox(
                            height: 5.h,
                            child: Row(
                              children: [
                                Text(
                                  'Recent Job',
                                  style:
                                      Theme.of(context).textTheme.titleMedium,
                                ),
                                const Spacer(),
                                TextButton(
                                  onPressed: () {},
                                  child: Text(
                                    "View all",
                                    style: TextStyle(
                                        color: AppTheme.primaryColors[500]),
                                  ),
                                )
                              ],
                            ),
                          ),
                          Expanded(
                            child: ListView.separated(
                              itemBuilder: (context, i) {
                                return RecentJobItem(
                                    onTap: () {
                                      JobsCubit.get(context).addOpenJob(
                                          job: JobsCubit.get(context)
                                              .recentJob[i]!);
                                      Navigator.pushNamed(
                                          context, AppRoute.jobDetail);
                                    },
                                    job: JobsCubit.get(context).recentJob[i]!);
                              },
                              itemCount:
                                  JobsCubit.get(context).recentJob.length == 1
                                      ? 1
                                      : 2,
                              separatorBuilder:
                                  (BuildContext context, int index) {
                                return Divider(
                                  color: AppTheme.neutralColors[200],
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                    );
                  }
                  return Container();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
