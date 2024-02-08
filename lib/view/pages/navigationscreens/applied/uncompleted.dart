import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gp/const.dart';
import 'package:gp/controller/jobscubit/jobs_cubit.dart';
import 'package:gp/core/uitlites/app_theme_class.dart';

import 'package:gp/models/job.dart';
import 'package:gp/view/pages/navigationscreens/applied/completing_applying_job.dart';

import 'package:gp/view/widget/recent_job_item.dart';
import 'package:sizer/sizer.dart';

class UnCompleted extends StatelessWidget {
  const UnCompleted({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<JobsCubit, JobsState>(
      builder: (context, state) {
        return SizedBox(
          height: 50.h,
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
                      horizontal: BorderSide(
                        color: AppTheme.neutralColors[200]!,
                      ),
                    ),
                  ),
                  child: Text(
                    "   ${JobsCubit.get(context).applyJobsfromDB.length} jobs",
                    style: Theme.of(context).textTheme.displayMedium!.copyWith(
                        color: AppTheme.neutralColors,
                        fontWeight: AppTheme.mediumWeight),
                  ),
                ),
              ),
              ...JobsCubit.get(context).applyJobsfromDB.map((e) {
                for (Job damyJob in JobsCubit.get(context).jobs) {
                  if (damyJob.data!.id == e.jobId) {
                    return InkWell(
                      onTap: () {
                        fullNameCon.text = e.fullName!;
                        emailCon.text = e.email!;
                        handphoneCon.text = e.handphone!;
                        JobsCubit.get(context).applyedjob = damyJob;
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => CompletingApplyingJob(
                              applyJobModel: e,
                              job: damyJob,
                            ),
                          ),
                        );
                      },
                      child: Column(
                        children: [
                          RecentJobItem(
                            onTap: () {
                              fullNameCon.text = e.fullName!;
                              emailCon.text = e.email!;
                              handphoneCon.text = e.handphone!;
                              JobsCubit.get(context).applyedjob = damyJob;
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => CompletingApplyingJob(
                                    applyJobModel: e,
                                    job: damyJob,
                                  ),
                                ),
                              );
                            },
                            job: damyJob,
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          SvgPicture.asset('assets/images/Step${e.step}.svg'),
                          Divider(
                            color: AppTheme.neutralColors[200],
                            indent: 5.w,
                            endIndent: 5.w,
                          )
                        ],
                      ),
                    );
                  }
                }
                return Container();
              })
            ],
          ),
        );
      },
    );
  }
}

class JobUnCompleted extends StatelessWidget {
  const JobUnCompleted({super.key, required this.job});
  final Job job;
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
