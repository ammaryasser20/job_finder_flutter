import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gp/const.dart';
import 'package:gp/controller/jobscubit/jobs_cubit.dart';

import 'package:gp/controller/searchcubit/search_cubit.dart';
import 'package:gp/core/uitlites/app_route.dart';
import 'package:gp/core/uitlites/app_theme_class.dart';
import 'package:gp/view/widget/bottom_sheet.dart';
import 'package:gp/view/widget/recent_job_item.dart';

import 'package:gp/view/widget/search_filed.dart';
import 'package:sizer/sizer.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 1.w, vertical: 1.h),
              child: Row(
                children: [
                  IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const Icon(Icons.arrow_back),
                  ),
                  Searchfiled(
                    onSubmitted: (value) {},
                    hintText: 'Type something...',
                    controller: searchCon,
                    onTap: () {
                      Navigator.pop(context);
                    },
                    readOnly: true,
                    height: 50,
                    width: 75.w,
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            SizedBox(
              height: 5.h,
              child: Row(
                children: [
                  IconButton(
                      onPressed: () {
                        showModalBottomSheet(
                            isScrollControlled: true,
                            context: context,
                            builder: (con) {
                              return const DefaultBottomSheet();
                            });
                      },
                      icon: SvgPicture.asset('assets/images/Filter.svg')),
                  BlocBuilder<SearchCubit, SearchState>(
                    builder: (context, state) {
                      return Expanded(
                        child: ListView.separated(
                          scrollDirection: Axis.horizontal,
                          itemCount: 6,
                          itemBuilder: (context, i) {
                            return Container(
                                padding:
                                    const EdgeInsets.only(right: 14, left: 14),
                                decoration: BoxDecoration(
                                    color: SearchCubit.get(context)
                                            .jopsType
                                            .contains(jobTypes[i])
                                        ? AppTheme.primaryColors[900]
                                        : Colors.white,
                                    border: Border.all(
                                        color: SearchCubit.get(context)
                                                .jopsType
                                                .contains(jobTypes[i])
                                            ? AppTheme.primaryColors[900]!
                                            : AppTheme.neutralColors[300]!),
                                    borderRadius: BorderRadius.circular(100)),
                                child: Center(
                                  child: Text(
                                    jobTypes[i],
                                    style: TextStyle(
                                        color: SearchCubit.get(context)
                                                .jopsType
                                                .contains(jobTypes[i])
                                            ? Colors.white
                                            : AppTheme.neutralColors[500]),
                                  ),
                                ));
                          },
                          separatorBuilder: (BuildContext context, int index) {
                            return const SizedBox(
                              width: 10,
                            );
                          },
                        ),
                      );
                    },
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            BlocBuilder<SearchCubit, SearchState>(
              builder: (context, state) {
                if (SearchCubit.get(context).searchJob.isNotEmpty) {
                  return SizedBox(
                    width: 100.w,
                    height: 4.h,
                    child: Container(
                        padding: const EdgeInsets.only(left: 10, top: 5),
                        decoration: BoxDecoration(
                          color: AppTheme.neutralColors[100],
                          border: Border.symmetric(
                            horizontal: BorderSide(
                              color: AppTheme.neutralColors[200]!,
                            ),
                          ),
                        ),
                        child: Text(
                          "Featuring ${SearchCubit.get(context).searchJob.length} jobs",
                          style: TextStyle(
                            color: AppTheme.neutralColors[500],
                          ),
                        )),
                  );
                } else {
                  return Column(
                    children: [
                      SizedBox(
                        height: 15.h,
                      ),
                      SvgPicture.asset('assets/images/Search Ilustration.svg'),
                      const SizedBox(
                        height: 15,
                      ),
                      Text(
                        'Search not found',
                        style: Theme.of(context).textTheme.headlineSmall,
                      ),
                      SizedBox(
                        height: 1.h,
                      ),
                      Text(
                        textAlign: TextAlign.center,
                        'Try searching with different keywords so\n we can show you',
                        style: Theme.of(context).textTheme.displayLarge,
                      )
                    ],
                  );
                }
              },
            ),
            Expanded(
              child: BlocBuilder<SearchCubit, SearchState>(
                builder: (context, state) {
                  return ListView.separated(
                    itemBuilder: (context, i) {
                      return RecentJobItem(
                          onTap: () {
                            JobsCubit.get(context).addOpenJob(
                                job: SearchCubit.get(context).searchJob[i]);
                            Navigator.pushNamed(context, AppRoute.jobDetail);
                          },
                          job: SearchCubit.get(context).searchJob[i]);
                    },
                    itemCount: SearchCubit.get(context).searchJob.length,
                    separatorBuilder: (BuildContext context, int index) {
                      return Divider(
                        indent: 5.w,
                        endIndent: 5.w,
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
