import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gp/controller/navigationcubit/navigation_cubit.dart';
import 'package:gp/core/uitlites/app_theme_class.dart';
import 'package:gp/main.dart';
import 'package:gp/view/pages/navigationscreens/applied/applied_screen.dart';
import 'package:sizer/sizer.dart';

import 'package:gp/view/pages/navigationscreens/home_screen.dart';
import 'package:gp/view/pages/navigationscreens/masseges/messages_screen.dart';
import 'package:gp/view/pages/navigationscreens/profile/profile_screen.dart';
import 'package:gp/view/pages/navigationscreens/saved_screen.dart';

String baseUrl = "https://project2.amit-learning.com/api/";
String registerUrl = "auth/register";
String logInUrl = "auth/login";
String sugesstJob = "jobs/sugest/2";

List<String> tittle = [
  "Explore over 25,924 available job roles and upgrade your operator now.",
  "Immediately join us and start applying for the \njob you are interested in.",
  "The better the skills you have, the greater the \ngood job opportunities for you.",
];

TextEditingController userNameCon = TextEditingController();
TextEditingController emailCon = TextEditingController();
TextEditingController passCon = TextEditingController();
TextEditingController searchCon = TextEditingController();
TextEditingController locationCon = TextEditingController();
TextEditingController salaryCon = TextEditingController();
TextEditingController fullNameCon = TextEditingController();
TextEditingController handphoneCon = TextEditingController();
PageController applyjobCon = PageController(initialPage: 0);
PageController jobCon = PageController(initialPage: 0);

List<Widget> onText = [
  RichText(
    text: TextSpan(
      style: Theme.of(NavigationService.navigatorKey.currentContext!)
          .textTheme
          .headlineLarge!
          .copyWith(fontWeight: AppTheme.mediumWeight),
      children: [
        TextSpan(
            text: 'Find a job, and ',
            style: TextStyle(color: AppTheme.neutralColors[900])),
        TextSpan(
          text: ' start building',
          style: TextStyle(
              color: Theme.of(NavigationService.navigatorKey.currentContext!)
                  .primaryColor),
        ),
        TextSpan(
          text: ' your career\nfrom now on',
          style: TextStyle(color: AppTheme.neutralColors[900]),
        ),
      ],
    ),
  ),
  RichText(
    text: TextSpan(
      style: Theme.of(NavigationService.navigatorKey.currentContext!)
          .textTheme
          .headlineLarge!
          .copyWith(fontWeight: AppTheme.mediumWeight),
      children: [
        TextSpan(
            text: 'Hundreds of jobs are waiting for you to ',
            style: TextStyle(color: AppTheme.neutralColors[900])),
        TextSpan(
          text: ' join together',
          style: TextStyle(
              color: Theme.of(NavigationService.navigatorKey.currentContext!)
                  .primaryColor),
        ),
        //  Color.fromRGBO(51, 102, 255, 1)
      ],
    ),
  ),
  RichText(
    text: TextSpan(
      style: TextStyle(
        fontSize: 25.sp,
        fontFamily: '.SF Pro Display',
        fontWeight: FontWeight.w500,
      ),
      children: [
        TextSpan(
            text: 'Get the best ',
            style: TextStyle(color: AppTheme.neutralColors[900])),
        TextSpan(
          text: ' choice for the job',
          style: TextStyle(
              color: Theme.of(NavigationService.navigatorKey.currentContext!)
                  .primaryColor),
        ),
        TextSpan(
          text: " you've always dreamed of",
          style: TextStyle(color: AppTheme.neutralColors[900]),
        ),
      ],
    ),
  ),
];
List<String> jops = [
  "UI/UX Designer",
  "Ilustrator Designer",
  "Developer",
  "Management",
  'Information Technology',
  'Research and Analytics'
];
List<String> jobTypes = [
  'Full Time',
  'Remote',
  'Contract',
  'Part Time',
  'Onsite',
  'Internship',
];
List<String> countriesNames = [
  'United States',
  'Malaysia',
  'Singapore',
  'Indonesia',
  'Philiphines',
  'Polandia',
  'India',
  'Vietnam',
  'China',
  'Canada',
  'Saudi Arabia',
  'Argentina',
  'Brazil'
];
List<Widget> screens = const [
  HomeScreen(),
  MessagesScreen(),
  AppliedScreen(),
  SavedScreen(),
  ProfileScreen()
];

List<BottomNavigationBarItem> bottomNavigationBarItems(BuildContext context) =>
    [
      BottomNavigationBarItem(
          icon: SvgPicture.asset(NavigationCubit.get(context).index == 0
              ? "assets/images/Navigationbar/home1.svg"
              : "assets/images/Navigationbar/home.svg"),
          label: "Home"),
      BottomNavigationBarItem(
          icon: SvgPicture.asset(NavigationCubit.get(context).index == 1
              ? "assets/images/Navigationbar/messages1.svg"
              : "assets/images/Navigationbar/messages.svg"),
          label: "Messages"),
      BottomNavigationBarItem(
          icon: SvgPicture.asset(NavigationCubit.get(context).index == 2
              ? "assets/images/Navigationbar/applied1.svg"
              : "assets/images/Navigationbar/applied.svg"),
          label: "Applied"),
      BottomNavigationBarItem(
          icon: SvgPicture.asset(NavigationCubit.get(context).index == 3
              ? "assets/images/Navigationbar/saved1.svg"
              : "assets/images/Navigationbar/saved.svg"),
          label: "Saved"),
      BottomNavigationBarItem(
          icon: SvgPicture.asset(NavigationCubit.get(context).index == 4
              ? "assets/images/Navigationbar/profile1.svg"
              : "assets/images/Navigationbar/profile.svg"),
          label: "Profile"),
    ];
