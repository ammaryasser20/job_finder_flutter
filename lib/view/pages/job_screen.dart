import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gp/const.dart';
import 'package:gp/controller/jobscubit/jobs_cubit.dart';
import 'package:gp/core/uitlites/app_route.dart';
import 'package:gp/core/uitlites/app_theme_class.dart';
import 'package:gp/view/widget/Job_desicription.dart';
import 'package:gp/view/widget/company_desicription.dart';
import 'package:gp/view/widget/default_bottom.dart';
import 'package:sizer/sizer.dart';
import 'package:toggle_switch/toggle_switch.dart';

class JobDetail extends StatelessWidget {
  const JobDetail({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<JobsCubit, JobsState>(
      builder: (context, state) {
        return Scaffold(
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerFloat,
          floatingActionButton: DefaultBottoom(
              text: 'Apply now',
              function: () {
                JobsCubit.get(context).applyedjob =
                    JobsCubit.get(context).openJob;
                Navigator.pushNamed(context, AppRoute.applyJob);
              }),
          extendBody: true,
          appBar: AppBar(
            leading: IconButton(
              icon: const Icon(Icons.arrow_back),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            centerTitle: true,
            title: Text(
              'Job Detail',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            actions: [
              IconButton(
                icon: SvgPicture.asset(
                  JobsCubit.get(context)
                          .savedJobsIDs
                          .containsKey(JobsCubit.get(context).openJob.data!.id)
                      ? "assets/images/Navigationbar/saved1.svg"
                      : "assets/images/Navigationbar/saved.svg",
                ),
                onPressed: () {
                  if (JobsCubit.get(context)
                      .savedJobsIDs
                      .containsKey(JobsCubit.get(context).openJob.data!.id)) {
                    JobsCubit.get(context).deleteSavedJob(
                        id: JobsCubit.get(context).openJob.data!.id!,
                        context: context);
                  } else {
                    JobsCubit.get(context).saveingJob(
                        id: JobsCubit.get(context).openJob.data!.id!,
                        context: context);
                  }
                },
              )
            ],
          ),
          body: Padding(
            padding: EdgeInsets.all(5.w),
            child: Column(
              children: [
                const Icon(
                  Icons.work,
                ),
                SizedBox(
                  width: 90.w,
                ),
                Text(
                  JobsCubit.get(context).openJob.data!.name!,
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                Text(
                  JobsCubit.get(context).openJob.data!.compName!,
                  style: Theme.of(context)
                      .textTheme
                      .displaySmall!
                      .copyWith(color: AppTheme.neutralColors[700]),
                ),
                SizedBox(
                  height: 2.h,
                ),
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                  decoration: BoxDecoration(
                      color: const Color.fromRGBO(33, 150, 243, .25),
                      borderRadius: BorderRadius.circular(20)),
                  child: Text(
                    JobsCubit.get(context).openJob.data!.jobTimeType!,
                    style: Theme.of(context)
                        .textTheme
                        .displaySmall!
                        .copyWith(color: AppTheme.primaryColors),
                  ),
                ),
                SizedBox(
                  height: 5.h,
                ),
                ToggleSwitch(
                
                  minWidth: 29.w,
                  initialLabelIndex: 0,
                  cornerRadius: 20.0,
                  totalSwitches: 3,
                  inactiveBgColor: AppTheme.neutralColors[100],
                  activeBgColor: [AppTheme.primaryColors[900]!],
                  radiusStyle: true,
                  labels: const ['Desicription', 'Company', 'People'],
                  onToggle: (index) {
                    jobCon.animateToPage(index!,
                        duration: const Duration(seconds: 1),
                        curve: Curves.ease);
                  },
                ),
                Expanded(
                  child: PageView(
                    physics: const NeverScrollableScrollPhysics(),
                    controller: jobCon,
                    children: [
                      const JobDesicription(),
                      const CompanyDesicription(),
                      Container(
                        color: Colors.black,
                        width: 220,
                        height: 200,
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
