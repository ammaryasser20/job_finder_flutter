import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gp/controller/jobscubit/jobs_cubit.dart';
import 'package:gp/core/uitlites/app_theme_class.dart';

import 'package:gp/models/job.dart';


class RecentJobItem extends StatelessWidget {
  const RecentJobItem({super.key, required this.job, required this.onTap});
  final Function onTap;
  final Job job;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onTap();
      },
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Row(
          children: [
            Expanded(
              child: ListTile(
                leading: const Icon(Icons.work),
                title: Text(
                  job.data!.name!,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                subtitle: Text(
                  job.data!.compName!,
                  style: Theme.of(context)
                      .textTheme
                      .displaySmall!
                      .copyWith(color: AppTheme.neutralColors[700]),
                ),
              ),
            ),
            BlocBuilder<JobsCubit, JobsState>(
              builder: (context, state) {
                return IconButton(
                  icon: SvgPicture.asset(
                      JobsCubit.get(context)
                              .savedJobsIDs
                              .containsKey(job.data!.id)
                          ? "assets/images/Navigationbar/saved1.svg"
                          : "assets/images/Navigationbar/saved.svg",
                      color: JobsCubit.get(context)
                              .savedJobsIDs
                              .containsKey(job.data!.id)
                          ? null
                          : Colors.black),
                  onPressed: () {
                    if (JobsCubit.get(context)
                        .savedJobsIDs
                        .containsKey(job.data!.id)) {
                      JobsCubit.get(context)
                          .deleteSavedJob(id: job.data!.id!, context: context);
                    } else {
                      JobsCubit.get(context)
                          .saveingJob(id: job.data!.id!, context: context);
                    }
                  },
                );
              },
            )
          ],
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Row(
            children: [
              Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                decoration: BoxDecoration(
                    color: AppTheme.primaryColors[100],
                    borderRadius: BorderRadius.circular(20)),
                child: Text(
                  job.data!.jobTimeType!,
                  style: Theme.of(context)
                      .textTheme
                      .displaySmall!
                      .copyWith(color: AppTheme.primaryColors[500]),
                ),
              ),
              const Spacer(),
              Text(
                job.data!.salary!,
                style: Theme.of(context)
                    .textTheme
                    .displayLarge!
                    .copyWith(color: AppTheme.successColors[700]),
              ),
              Text(
                '/Month',
                style: Theme.of(context)
                    .textTheme
                    .displaySmall!
                    .copyWith(color: AppTheme.neutralColors[500]),
              ),
            ],
          ),
        ),
      ]),
    );
  }
}
