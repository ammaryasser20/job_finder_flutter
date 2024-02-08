import 'package:flutter/material.dart';
import 'package:gp/controller/jobscubit/jobs_cubit.dart';
import 'package:gp/core/uitlites/app_route.dart';
import 'package:gp/core/uitlites/app_theme_class.dart';
import 'package:gp/models/job.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sizer/sizer.dart';

class JobItem extends StatelessWidget {
  const JobItem({super.key, required this.job});
  final Job job;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 80.w,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          decoration: BoxDecoration(
            color: AppTheme.primaryColors[900],
            borderRadius: BorderRadius.circular(20),
            // image: DecorationImage(
            //   image: NetworkImage(
            //     job.data!.image ??
            //         "https://developers.google.com/static/maps/documentation/streetview/images/error-image-generic.png",
            //   ),
            //   fit: BoxFit.fill,
            // ),
          ),
          child: InkWell(
            borderRadius: BorderRadius.circular(20),
            onTap: () {
              JobsCubit.get(context).addRecentJob(job);
              JobsCubit.get(context).addOpenJob(job: job);
              Navigator.pushNamed(context, AppRoute.jobDetail);
            },
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Row(
                children: [
                  Expanded(
                    child: ListTile(
                      leading: const Icon(Icons.work),
                      title: Text(job.data!.name!,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style:
                              Theme.of(context).textTheme.titleMedium!.copyWith(
                                    color: Colors.white,
                                  )),
                      subtitle: Text(
                        job.data!.compName!,
                        style: Theme.of(context)
                            .textTheme
                            .displaySmall!
                            .copyWith(color: AppTheme.neutralColors[400]),
                      ),
                    ),
                  ),
                  IconButton(
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
                            : Colors.white),
                    onPressed: () {
                      if (JobsCubit.get(context)
                          .savedJobsIDs
                          .containsKey(job.data!.id)) {
                        JobsCubit.get(context).deleteSavedJob(
                            id: job.data!.id!, context: context);
                      } else {
                        JobsCubit.get(context)
                            .saveingJob(id: job.data!.id!, context: context);
                      }
                    },
                  )
                ],
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                  decoration: BoxDecoration(
                      color: const Color.fromRGBO(255, 255, 255, 0.14),
                      borderRadius: BorderRadius.circular(20)),
                  child: Text(
                    job.data!.jobTimeType!,
                    style: Theme.of(context)
                        .textTheme
                        .displaySmall!
                        .copyWith(color: Colors.white),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(15),
                child: Row(
                  children: [
                    Text(
                      '\$${job.data!.salary!}',
                      style: Theme.of(context)
                          .textTheme
                          .titleLarge!
                          .copyWith(color: Colors.white),
                    ),
                    Text(
                      '/Month',
                      style: Theme.of(context)
                          .textTheme
                          .displaySmall!
                          .copyWith(color: AppTheme.neutralColors[400]),
                    ),
                    const Spacer(),
                    SizedBox(
                      height: 40,
                      child: OutlinedButton(
                        style: OutlinedButton.styleFrom(
                            side:
                                BorderSide(color: AppTheme.primaryColors[500]!),
                            backgroundColor: AppTheme.primaryColors[500]!),
                        onPressed: () {
                          JobsCubit.get(context).applyedjob = job;
                          Navigator.pushNamed(context, AppRoute.applyJob);
                        },
                        child: Text(
                          "Apply now",
                          style: Theme.of(context)
                              .textTheme
                              .displaySmall!
                              .copyWith(color: Colors.white),
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ]),
          ),
        ),
      ),
    );
  }
}
