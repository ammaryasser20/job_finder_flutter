import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gp/controller/jobscubit/jobs_cubit.dart';
import 'package:gp/core/uitlites/app_route.dart';
import 'package:gp/core/uitlites/app_theme_class.dart';
import 'package:gp/models/job.dart';
import 'package:gp/view/widget/recent_job_item.dart';
import 'package:sizer/sizer.dart';

class Completed extends StatelessWidget {
  const Completed({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<JobsCubit, JobsState>(
      builder: (context, state) {
        if (JobsCubit.get(context).applyJobsfromAPI.isNotEmpty) {
          return SizedBox(
            height: 90.h,
            width: 100.w,
            child: ListView(
              children: [
                SizedBox(
                  width: 100.w,
                  height: 4.h,
                  child: Container(
                      padding: const EdgeInsets.only(left: 10, top: 7),
                      decoration: BoxDecoration(
                        color: AppTheme.neutralColors[100],
                        border: Border.symmetric(
                          horizontal:
                              BorderSide(color: AppTheme.neutralColors[200]!),
                        ),
                      ),
                      child: Text(
                        "   ${JobsCubit.get(context).applyJobsfromAPI.length} jobs",
                        style:
                            Theme.of(context).textTheme.displayMedium!.copyWith(
                                  color: AppTheme.neutralColors,
                                  fontWeight: AppTheme.mediumWeight,
                                ),
                      )),
                ),
                ...JobsCubit.get(context).applyJobsfromAPI.map((e) {
                  for (Job damyJob in JobsCubit.get(context).jobs) {
                    if (damyJob.data!.id == e.jobId) {
                      //     print("aaaaa");
                      return Column(
                        children: [
                          RecentJobItem(
                            onTap: () {
                              JobsCubit.get(context).addOpenJob(job: damyJob);
                              Navigator.pushNamed(context, AppRoute.jobDetail);
                            },
                            job: damyJob,
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Divider(
                            color: AppTheme.neutralColors[300],
                            indent: 5.w,
                            endIndent: 5.w,
                          )
                        ],
                      );
                    }
                  }
                  return Container();
                })
              ],
            ),
          );
        }
        return Container();
      },
    );
  }
}
