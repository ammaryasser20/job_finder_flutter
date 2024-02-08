import 'package:flutter/material.dart';
import 'package:gp/controller/jobscubit/jobs_cubit.dart';
import 'package:gp/core/uitlites/app_theme_class.dart';
import 'package:gp/view/widget/tittle_text.dart';
import 'package:sizer/sizer.dart';

class JobDesicription extends StatelessWidget {
  const JobDesicription({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 3.h,
          ),
          const TittelText(
            tittel: 'Job Description',
          ),
          SizedBox(
            height: 1.h,
          ),
          Text(
            JobsCubit.get(context).openJob.data!.jobDescription!,
            style: Theme.of(context).textTheme.displaySmall!,
          ),
          SizedBox(
            height: 3.h,
          ),
          const TittelText(
            tittel: 'Skill Required',
          ),
          SizedBox(
            height: 1.h,
          ),
          ...JobsCubit.get(context)
              .openJob
              .data!
              .jobSkill!
              .split('\n')
              .map((e) {
            return Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsetsDirectional.only(end: 8.0),
                  child: Text(
                    '•',
                    style: Theme.of(context)
                        .textTheme
                        .displayMedium!
                        .copyWith(color: AppTheme.neutralColors[800]),
                  ),
                ),
                Expanded(
                  child: Text(
                    e,
                    style: Theme.of(context).textTheme.displaySmall!,
                  ),
                ),
              ],
            );
          })
        
        ],
      ),
    );
  }
}
