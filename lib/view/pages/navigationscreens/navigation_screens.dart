import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gp/const.dart';
import 'package:gp/controller/jobscubit/jobs_cubit.dart';
import 'package:gp/controller/navigationcubit/navigation_cubit.dart';
import 'package:gp/controller/searchcubit/search_cubit.dart';
import 'package:gp/controller/usercubit/user_cubit.dart';
import 'package:gp/core/uitlites/app_theme_class.dart';

class NavigationScreens extends StatefulWidget {
  const NavigationScreens({super.key});

  @override
  State<NavigationScreens> createState() => _NavigationScreensState();
}

class _NavigationScreensState extends State<NavigationScreens> {
  @override
  void initState() {
    super.initState();

     JobsCubit.get(context).addJobs(UserCubit.get(context).user!);
    SearchCubit.get(context).getAllRecentSearches();
  }
  

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NavigationCubit, NavigationState>(
      builder: (context, state) {
        return Scaffold(
          body: screens[NavigationCubit.get(context).index],
          bottomNavigationBar: BottomNavigationBar(
              selectedFontSize: 12,
              type: BottomNavigationBarType.fixed,
              showUnselectedLabels: true,
              currentIndex: NavigationCubit.get(context).index,
              unselectedItemColor: AppTheme.neutralColors[400],
              selectedItemColor: Theme.of(context).colorScheme.primary,
              onTap: (value) {
                NavigationCubit.get(context).changeIndex(newIndex: value);
              },
              items: bottomNavigationBarItems(context)),
        );
      },
    );
  }
}
