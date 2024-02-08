import 'package:flutter/material.dart';
import 'package:gp/controller/jobscubit/jobs_cubit.dart';
import 'package:gp/core/uitlites/app_theme_class.dart';
import 'package:gp/view/widget/tittle_text.dart';
import 'package:sizer/sizer.dart';

class CompanyDesicription extends StatelessWidget {
  const CompanyDesicription({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 3.h,
        ),
        const TittelText(
          tittel: 'Contact Us',
        ),
        SizedBox(
          height: 1.h,
        ),
        Row(
          children: [
            Container(
              width: 44.w,
              height: 8.h,
              padding: const EdgeInsets.only(left: 5, top: 5),
              decoration: BoxDecoration(
                  border: Border.all(color: AppTheme.neutralColors[200]!),
                  borderRadius: BorderRadius.circular(10)),
              child: Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(2.0),
                      child: Text(
                        'Email',
                        style: Theme.of(context)
                            .textTheme
                            .displaySmall!
                            .copyWith(color: AppTheme.neutralColors[400]),
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Expanded(
                      child: Text(
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        JobsCubit.get(context).openJob.data!.compEmail!,
                        style: Theme.of(context)
                            .textTheme
                            .displayMedium!
                            .copyWith(color: AppTheme.neutralColors[900]),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              width: 5,
            ),
            Container(
              width: 44.w,
              height: 8.h,
              padding: const EdgeInsets.only(left: 5, top: 5),
              decoration: BoxDecoration(
                  border: Border.all(color: AppTheme.neutralColors[200]!),
                  borderRadius: BorderRadius.circular(10)),
              child: Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(2.0),
                      child: Text(
                        'Website',
                        style: Theme.of(context)
                            .textTheme
                            .displaySmall!
                            .copyWith(color: AppTheme.neutralColors[400]),
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Expanded(
                        child: Text(
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      JobsCubit.get(context).openJob.data!.compWebsite!,
                      style: Theme.of(context)
                          .textTheme
                          .displayMedium!
                          .copyWith(color: AppTheme.neutralColors[900]),
                    )),
                  ],
                ),
              ),
            )
          ],
        ),
        SizedBox(
          height: 3.h,
        ),
        const Text(
          'About Company',
          style: TextStyle(fontWeight: FontWeight.w500),
        ),
        SizedBox(
          height: 3.h,
        ),
        Text(
          JobsCubit.get(context).openJob.data!.aboutComp!,
          style: Theme.of(context).textTheme.displaySmall!,
        ),
      ],
    );
  }
}
