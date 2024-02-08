import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gp/controller/jobscubit/jobs_cubit.dart';
import 'package:gp/core/uitlites/app_route.dart';
import 'package:gp/core/uitlites/app_theme_class.dart';
import 'package:gp/view/widget/default_more_option_item.dart';

import 'package:sizer/sizer.dart';

class SavedScreen extends StatelessWidget {
  const SavedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Saved',
                style: Theme.of(context).textTheme.titleLarge,
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          BlocBuilder<JobsCubit, JobsState>(
            builder: (context, state) {
              if (JobsCubit.get(context).savedJob.isNotEmpty) {
                return Expanded(
                  child: Column(
                    children: [
                      SizedBox(
                        width: 100.w,
                        height: 4.h,
                        child: Container(
                            decoration: BoxDecoration(
                              color: AppTheme.neutralColors[100],
                              border: Border.symmetric(
                                horizontal: BorderSide(
                                  color: AppTheme.neutralColors[200]!,
                                ),
                              ),
                            ),
                            child: Center(
                              child: Text(
                                "${JobsCubit.get(context).savedJob.length} Job Saved ",
                                style: Theme.of(context)
                                    .textTheme
                                    .displayMedium!
                                    .copyWith(color: AppTheme.neutralColors),
                              ),
                            )),
                      ),
                      Expanded(
                        child: ListView.separated(
                          itemCount: JobsCubit.get(context).savedJob.length,
                          itemBuilder: (context, index) {
                            return InkWell(
                              onTap: () {
                                JobsCubit.get(context).addOpenJob(
                                    job:
                                        JobsCubit.get(context).savedJob[index]);
                                Navigator.pushNamed(
                                    context, AppRoute.jobDetail);
                              },
                              child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        Expanded(
                                          child: ListTile(
                                            leading: const Icon(Icons.work),
                                            title: Text(
                                              JobsCubit.get(context)
                                                  .savedJob[index]
                                                  .data!
                                                  .name!,
                                              maxLines: 1,
                                              overflow: TextOverflow.ellipsis,
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .titleMedium,
                                            ),
                                            subtitle: Text(
                                              JobsCubit.get(context)
                                                  .savedJob[index]
                                                  .data!
                                                  .compName!,
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .displaySmall!
                                                  .copyWith(
                                                      color: AppTheme
                                                          .neutralColors[700]),
                                            ),
                                          ),
                                        ),
                                        IconButton(
                                          icon: SvgPicture.asset(
                                              'assets/images/more.svg'),
                                          onPressed: () {
                                            showModalBottomSheet(
                                                isScrollControlled: true,
                                                context: context,
                                                builder: (con) {
                                                  return SizedBox(
                                                    height: 30.h,
                                                    width: 100.w,
                                                    child: Column(
                                                      children: [
                                                        const SizedBox(
                                                          height: 30,
                                                        ),
                                                        MoreOptionItem(
                                                          text: 'Apply Job',
                                                          icon:
                                                              'assets/images/more_option_Icon/ApplyJob.svg',
                                                          function: () {
                                                            JobsCubit.get(
                                                                        context)
                                                                    .applyedjob =
                                                                JobsCubit.get(
                                                                        context)
                                                                    .savedJob[index];

                                                            Navigator.pushNamed(
                                                                context,
                                                                AppRoute
                                                                    .applyJob);
                                                          },
                                                        ),
                                                        const SizedBox(
                                                          height: 10,
                                                        ),
                                                        MoreOptionItem(
                                                          text: 'Share via...',
                                                          icon:
                                                              'assets/images/more_option_Icon/Share via.svg',
                                                          function: () {},
                                                        ),
                                                        const SizedBox(
                                                          height: 10,
                                                        ),
                                                        MoreOptionItem(
                                                          text: 'Cancel save',
                                                          icon:
                                                              'assets/images/more_option_Icon/saved.svg',
                                                          function: () {
                                                            JobsCubit.get(
                                                                    context)
                                                                .deleteSavedJob(
                                                                    id: JobsCubit.get(
                                                                            context)
                                                                        .savedJob[
                                                                            index]
                                                                        .data!
                                                                        .id!,
                                                                    context:
                                                                        context);
                                                            Navigator.pop(
                                                                context);
                                                          },
                                                        )
                                                      ],
                                                    ),
                                                  );
                                                });
                                          },
                                        )
                                      ],
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 15),
                                      child: Row(
                                        children: [
                                          Text(
                                            'Posted in ${JobsCubit.get(context).savedJob[index].data!.createdAt!.substring(0, 10)}',
                                            style: Theme.of(context)
                                                .textTheme
                                                .displaySmall,
                                          ),
                                          const Spacer(),
                                          const Icon(
                                            Icons.access_time_sharp,
                                            color: Colors.green,
                                            size: (12),
                                          ),
                                          const SizedBox(
                                            width: 5,
                                          ),
                                          Text(
                                            'Be an early applicant',
                                            style: Theme.of(context)
                                                .textTheme
                                                .displaySmall,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ]),
                            );
                          },
                          separatorBuilder: (BuildContext context, int index) {
                            return Divider(
                              indent: 5.w,
                              endIndent: 5.w,
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                );
              } else {
                return Column(
                  children: [
                    SizedBox(
                      height: 15.h,
                    ),
                    SvgPicture.asset('assets/images/Saved Ilustration.svg'),
                    const SizedBox(
                      height: 15,
                    ),
                    Text(
                      'Nothing has been saved yet',
                      style: Theme.of(context).textTheme.headlineSmall,
                    ),
                    SizedBox(
                      height: 1.h,
                    ),
                    Text(
                      textAlign: TextAlign.center,
                      'Press the star icon on the job you want to save.',
                      style: Theme.of(context).textTheme.displayLarge,
                    )
                  ],
                );
              }
            },
          ),
        ],
      ),
    );
  }
}
