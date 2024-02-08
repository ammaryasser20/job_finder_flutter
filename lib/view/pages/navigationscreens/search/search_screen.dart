import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gp/const.dart';
import 'package:gp/controller/searchcubit/search_cubit.dart';
import 'package:gp/controller/usercubit/user_cubit.dart';
import 'package:gp/core/uitlites/app_route.dart';
import 'package:gp/core/uitlites/app_theme_class.dart';
import 'package:gp/view/widget/search_filed.dart';
import 'package:sizer/sizer.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Expanded(
                child: Row(
                  children: [
                    IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: const Icon(Icons.arrow_back),
                    ),
                    Searchfiled(
                      onSubmitted: (value) {
                        value = value.trim();
                        SearchCubit.get(context)
                            .addRecentSearches(recent: value);
                        SearchCubit.get(context).addSearch(
                            name: value,
                            token: UserCubit.get(context).user!.token!);
                        Navigator.pushNamed(context, AppRoute.resultScreen);
                      },
                      hintText: 'Type something...',
                      controller: searchCon,
                      onTap: () {},
                      readOnly: false,
                      height: 50,
                      width: 75.w,
                    )
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 2.h,
            ),
            BlocBuilder<SearchCubit, SearchState>(
              builder: (context, state) {
                return SearchCubit.get(context).recentsearches.isNotEmpty
                    ? Expanded(
                        child: Column(
                          children: [
                            SizedBox(
                              width: 100.w,
                              height: 4.h,
                              child: Container(
                                padding:
                                    const EdgeInsets.only(left: 10, top: 5),
                                decoration: BoxDecoration(
                                  color: AppTheme.neutralColors[100],
                                  border: Border.symmetric(
                                    horizontal: BorderSide(
                                      color: AppTheme.neutralColors[200]!,
                                    ),
                                  ),
                                ),
                                width: 100.w,
                                height: 35,
                                child: Padding(
                                  padding: const EdgeInsets.only(top: 2),
                                  child: Text(
                                    "Recent searches",
                                    style: Theme.of(context)
                                        .textTheme
                                        .displayMedium!
                                        .copyWith(
                                            color: AppTheme.neutralColors[500]),
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 20.0),
                                child: ListView.builder(
                                    itemCount: SearchCubit.get(context)
                                        .recentsearches
                                        .length,
                                    itemBuilder: (context, i) {
                                      return Row(children: [
                                        const Icon(Icons.access_time_sharp),
                                        const SizedBox(
                                          width: 10,
                                        ),
                                        InkWell(
                                          onTap: () {
                                            searchCon.text =
                                                SearchCubit.get(context)
                                                    .recentsearches[i];
                                          },
                                          child: Text(
                                            SearchCubit.get(context)
                                                .recentsearches[i],
                                            style: Theme.of(context)
                                                .textTheme
                                                .displayMedium!
                                                .copyWith(
                                                    color: AppTheme
                                                        .neutralColors[900]),
                                          ),
                                        ),
                                        const Spacer(),
                                        IconButton(
                                            onPressed: () {
                                              SearchCubit.get(context)
                                                  .deleteRecentSearcheJob(
                                                      recent: SearchCubit.get(
                                                              context)
                                                          .recentsearches[i]);
                                            },
                                            icon: Icon(
                                              Icons.highlight_remove_sharp,
                                              color: AppTheme.dangerColors[500],
                                            ))
                                      ]);
                                    }),
                              ),
                            )
                          ],
                        ),
                      )
                    : Container();
              },
            )
          ],
        ),
      ),
    );
  }
}
