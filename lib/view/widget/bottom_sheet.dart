import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gp/const.dart';
import 'package:gp/controller/searchcubit/search_cubit.dart';
import 'package:gp/controller/usercubit/user_cubit.dart';
import 'package:gp/core/uitlites/app_theme_class.dart';
import 'package:gp/view/widget/default_bottom.dart';
import 'package:gp/view/widget/default_text_field.dart';
import 'package:gp/view/widget/tittle_text.dart';
import 'package:sizer/sizer.dart';

class DefaultBottomSheet extends StatelessWidget {
  const DefaultBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 95.h,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 3.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const Icon(Icons.arrow_back)),
                Text(
                  "Set Filter",
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                TextButton(
                    onPressed: () {
                      searchCon.clear();
                      locationCon.clear();
                      salaryCon.clear();
                      SearchCubit.get(context).clearJopsType();
                    },
                    child: Text(
                      "Reset",
                      style: Theme.of(context)
                          .textTheme
                          .displayLarge!
                          .copyWith(color: AppTheme.primaryColors),
                    ))
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            const TittelText(
              tittel: 'Job Tittle',
            ),
            const SizedBox(
              height: 5,
            ),
            DefaultTextField(
                prefixIcon: Icons.work_outline_rounded,
                hintText: 'Job Tittle',
                controller: searchCon,
                isForPassword: false,
                onChanged: () {}),
            const SizedBox(
              height: 10,
            ),
            const TittelText(
              tittel: 'Location',
            ),
            const SizedBox(
              height: 5,
            ),
            DefaultTextField(
                prefixIcon: Icons.location_on_outlined,
                hintText: 'Location',
                controller: locationCon,
                isForPassword: false,
                onChanged: () {}),
            const SizedBox(
              height: 10,
            ),
            const TittelText(
              tittel: 'Salary',
            ),
            const SizedBox(
              height: 5,
            ),
            DefaultTextField(
                prefixIcon: Icons.monetization_on_outlined,
                hintText: 'Salary',
                controller: salaryCon,
                isForPassword: false,
                onChanged: () {}),
            const SizedBox(
              height: 10,
            ),
            const TittelText(tittel: 'Job Type'),
            Wrap(
              children: [
                ...jobTypes.map((e) => BlocBuilder<SearchCubit, SearchState>(
                      builder: (context, state) {
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: InkWell(
                            borderRadius: BorderRadius.circular(20),
                            onTap: () {
                              if (SearchCubit.get(context)
                                  .jopsType
                                  .contains(e)) {
                                SearchCubit.get(context)
                                    .removeJobType(jobType: e);
                              } else {
                                SearchCubit.get(context).addJobType(jobType: e);
                              }
                            },
                            child: Container(
                              width: 90,
                              height: 40,
                              decoration: BoxDecoration(
                                  color: SearchCubit.get(context)
                                          .jopsType
                                          .contains(e)
                                      ? AppTheme.primaryColors[100]
                                      : null,
                                  border: Border.all(
                                      color: SearchCubit.get(context)
                                              .jopsType
                                              .contains(e)
                                          ? AppTheme.primaryColors[500]!
                                          : AppTheme.neutralColors[400]!),
                                  borderRadius: BorderRadius.circular(20)),
                              child: Center(
                                child: Text(e,
                                    style: Theme.of(context)
                                        .textTheme
                                        .displaySmall!
                                        .copyWith(
                                            color: SearchCubit.get(context)
                                                    .jopsType
                                                    .contains(e)
                                                ? AppTheme.primaryColors[500]
                                                : AppTheme.neutralColors[500])

                                    //  TextStyle(
                                    //     color: SearchCubit.get(context)
                                    //             .jopsType
                                    //             .contains(e)
                                    //         ? Colors.blueAccent
                                    //         : Colors.grey),
                                    ),
                              ),
                            ),
                          ),
                        );
                      },
                    ))
              ],
            ),
            const SizedBox(
              height: 150,
            ),
            Center(
                child: DefaultBottoom(
                    text: "Show result",
                    function: () {
                      SearchCubit.get(context)
                          .addRecentSearches(recent: searchCon.text);
                      SearchCubit.get(context).addSearch(
                          name: searchCon.text,
                          location: locationCon.text,
                          salary: salaryCon.text,
                          token: UserCubit.get(context).user!.token!);
                      Navigator.pop(context);
                    }))
          ],
        ),
      ),
    );
  }
}
