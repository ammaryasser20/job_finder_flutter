import 'package:flutter/material.dart';
import 'package:gp/core/uitlites/app_route.dart';
import 'package:gp/view/pages/Register/account_finished.dart';
import 'package:gp/view/pages/applyjob/apply_job.dart';
import 'package:gp/view/pages/Register/create_acc.dart';
import 'package:gp/view/pages/Register/create_acc2.dart';

import 'package:gp/view/pages/forgot_password/forgot_password.dart';
import 'package:gp/view/pages/job_screen.dart';

import 'package:gp/view/pages/navigationscreens/navigation_screens.dart';
import 'package:gp/view/pages/login_screen.dart';
import 'package:gp/view/pages/navigationscreens/profile/general/Login_And_security/change_password.dart';
import 'package:gp/view/pages/navigationscreens/profile/general/Login_And_security/change_phone.dart';
import 'package:gp/view/pages/navigationscreens/profile/general/Login_And_security/email_edit.dart';
import 'package:gp/view/pages/navigationscreens/profile/general/Login_And_security/face_id.dart';
import 'package:gp/view/pages/navigationscreens/profile/general/Login_And_security/login_and_security.dart';
import 'package:gp/view/pages/navigationscreens/profile/general/Login_And_security/two_step_verification.dart';
import 'package:gp/view/pages/navigationscreens/profile/general/Login_And_security/two_step_verification_2.dart';

import 'package:gp/view/pages/navigationscreens/profile/general/edit_profile.dart';
import 'package:gp/view/pages/navigationscreens/profile/general/language.dart';
import 'package:gp/view/pages/navigationscreens/profile/general/notification_setting.dart';
import 'package:gp/view/pages/navigationscreens/profile/general/portfolio.dart';
import 'package:gp/view/pages/navigationscreens/profile/others/help_center.dart';
import 'package:gp/view/pages/navigationscreens/profile/others/privacy_policy.dart';
import 'package:gp/view/pages/navigationscreens/profile/others/terms_and_conditions.dart';

import 'package:gp/view/pages/navigationscreens/search/search_screen.dart';
import 'package:gp/view/pages/spash.dart';
import 'package:gp/view/pages/Register/way_of_work.dart';

import '../../view/pages/navigationscreens/search/result_search_screen.dart';

Route<dynamic>? onGenerateRoute(RouteSettings routeSettings) {
  switch (routeSettings.name) {
    case AppRoute.createAccount:
      return MaterialPageRoute(builder: (_) =>  CreateAccount());
    case AppRoute.splashScreen:
      return MaterialPageRoute(builder: (_) => const SplashScreen());
    case AppRoute.createAcc2:
      return MaterialPageRoute(builder: (_) => const CreatAcc2());
    case AppRoute.wayOfWork:
      return MaterialPageRoute(builder: (_) => const WayOfWork());
    case AppRoute.accountDone:
      return MaterialPageRoute(builder: (_) => const AccountDone());
    case AppRoute.navigationScreens:
      return MaterialPageRoute(builder: (_) => const NavigationScreens());
    case AppRoute.loginScreen:
      return MaterialPageRoute(builder: (_) => const LoginScreen());
    case AppRoute.forgotPassword:
      return MaterialPageRoute(builder: (_) =>   const ForgotPassword());
    case AppRoute.searchScreen:
      return MaterialPageRoute(builder: (_) => const SearchScreen());
    case AppRoute.resultScreen:
      return MaterialPageRoute(builder: (_) => const ResultScreen());
    case AppRoute.jobDetail:
      return MaterialPageRoute(builder: (_) => const JobDetail());
    case AppRoute.applyJob:
      return MaterialPageRoute(builder: (_) => const ApplyJob());
    case AppRoute.editProfile:
      return MaterialPageRoute(builder: (_) => EditProfile());
    case AppRoute.loginAndSecurity:
      return MaterialPageRoute(builder: (_) => const LoginAndSecurity());
    case AppRoute.portfolio:
      return MaterialPageRoute(builder: (_) => const Portfolio());
    case AppRoute.language:
      return MaterialPageRoute(builder: (_) => const Language());
    case AppRoute.notificationSetting:
      return MaterialPageRoute(builder: (_) => const NotificationSetting());
    case AppRoute.emailEdit:
      return MaterialPageRoute(builder: (_) => const EmailEdit());
    case AppRoute.changePhone:
      return MaterialPageRoute(builder: (_) => const ChangePhone());
    case AppRoute.changePassword:
      return MaterialPageRoute(builder: (_) => const ChangePassword());
    case AppRoute.twoStepVerification:
      return MaterialPageRoute(builder: (_) => const TwoStepVerification());
    case AppRoute.faceID:
      return MaterialPageRoute(builder: (_) => const FaceID());
    case AppRoute.twoStepVerification2:
      return MaterialPageRoute(builder: (_) => TwoStepVerification2());
    case AppRoute.helpCenter:
      return MaterialPageRoute(builder: (_) => HelpCenter());
    case AppRoute.tremsAndConditions:
      return MaterialPageRoute(builder: (_) => const TremsAndConditions());
    case AppRoute.privacyPolicy:
      return MaterialPageRoute(builder: (_) => const PrivacyPolicy());
  }
  return null;
}



  //CompletingApplyingJob twoStepVerification2 faceID emailEdit static const String notificationsetting = "notificationsetting";