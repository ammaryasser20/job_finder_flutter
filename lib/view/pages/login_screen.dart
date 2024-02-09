import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gp/const.dart';
import 'package:gp/controller/navigationcubit/navigation_cubit.dart';
import 'package:gp/controller/textfieldcubit/text_field_cubit.dart';
import 'package:gp/controller/usercubit/user_cubit.dart';
import 'package:gp/core/uitlites/app_route.dart';
import 'package:gp/core/uitlites/app_theme_class.dart';
import 'package:gp/core/uitlites/enums.dart';
import 'package:gp/core/serves/cash_helper.dart';
import 'package:gp/view/widget/default_bottom.dart';
import 'package:gp/view/widget/default_text_field.dart';
import 'package:gp/view/widget/social_login.dart';
import 'package:sizer/sizer.dart';
import 'package:text_divider/text_divider.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Padding(
        padding: EdgeInsets.all(5.w),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  const Spacer(),
                  SvgPicture.asset('assets/images/Logo.svg')
                ],
              ),
              SizedBox(
                height: 5.h,
              ),
              Text(
                'Login',
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              SizedBox(
                height: 1.h,
              ),
              Text(
                'Please login to find your dream job',
                style: Theme.of(context).textTheme.displayLarge,
              ),
              SizedBox(
                height: 5.h,
              ),
              DefaultTextField(
                  onChanged: TextFieldCubit.get(context).isAllOKLogin,
                  prefixIcon: Icons.email,
                  hintText: "Email",
                  controller: emailCon,
                  isForPassword: false),
              SizedBox(
                height: 2.h,
              ),
              DefaultTextField(
                onChanged: TextFieldCubit.get(context).isAllOKLogin,
                prefixIcon: Icons.lock,
                hintText: "Password",
                controller: passCon,
                isForPassword: true,
              ),
              SizedBox(
                height: 1.h,
              ),
              Row(
                children: [
                  BlocBuilder<UserCubit, UserState>(
                    builder: (context, state) {
                      return SizedBox(
                        height: 30,
                        width: 30,
                        child: Checkbox(
                          side: BorderSide(color: AppTheme.neutralColors[400]!),
                          shape: ContinuousRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                          activeColor: Theme.of(context).colorScheme.primary,
                          value: UserCubit.get(context).rememberMy,
                          onChanged: (value) {
                            UserCubit.get(context).changeRememberMy();
                          },
                        ),
                      );
                    },
                  ),
                  Text(
                    "Remember me",
                    style: Theme.of(context)
                        .textTheme
                        .displayMedium!
                        .copyWith(color: AppTheme.neutralColors[800]),
                  ),
                  const Spacer(),
                  TextButton(
                      onPressed: () {
                        Navigator.pushNamed(context, AppRoute.forgotPassword);
                      },
                      child: Text(
                        "Forgot Password?",
                        style: Theme.of(context)
                            .textTheme
                            .displayMedium!
                            .copyWith(color: AppTheme.primaryColors),
                      ))
                ],
              ),
              SizedBox(
                height: 20.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Dont’t have an account?",
                    style: Theme.of(context).textTheme.displayMedium,
                  ),
                  TextButton(
                      onPressed: () {
                        Navigator.pushReplacementNamed(
                            context, AppRoute.createAccount);
                      },
                      child: Text(
                        "Register",
                        style: Theme.of(context)
                            .textTheme
                            .displayMedium!
                            .copyWith(color: AppTheme.primaryColors),
                      ))
                ],
              ),
              BlocBuilder<TextFieldCubit, TextFieldState>(
                builder: (context, state) {
                  return DefaultBottoom(
                    text: "Login",
                    function: TextFieldCubit.get(context).isAllNotEmpty &&
                            passCon.text.length > 8
                        ? () async {
                            NavigationCubit.get(context)
                                .changeIndex(newIndex: 0);
                            if (emailCon.text.contains("@")) {
                              if (await UserCubit.get(context).logIn(
                                  email: emailCon.text.trim(),
                                  pass: passCon.text.trim())) {
                                if (UserCubit.get(context).rememberMy) {
                                  await CashHelper.putString(
                                      key: Keys.tokenKey,
                                      value:
                                          UserCubit.get(context).user!.token!);
                                }
                  
                                Navigator.pushReplacementNamed(
                                    context, AppRoute.navigationScreens);
                              } else
                                ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                        content: Text(UserCubit.get(context)
                                            .massage!
                                            .massage!)));
                            } else
                              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                  content: Text(
                                      "The email field must be a valid email address")));
                          }
                        : () {},
                    color: TextFieldCubit.get(context).isAllNotEmpty
                        ? Theme.of(context).colorScheme.primary
                        : AppTheme.neutralColors[300]!,
                    fontcolor: TextFieldCubit.get(context).isAllNotEmpty
                        ? Colors.white
                        : Theme.of(context).colorScheme.secondary,
                  );
                },
              ),
              SizedBox(
                height: 2.h,
              ),
              TextDivider.horizontal(
                color: AppTheme.neutralColors[300],
                text: Text(
                  'Or Sign up With Account',
                  style: Theme.of(context).textTheme.displayMedium,
                ),
              ),
              SizedBox(
                height: 1.h,
              ),
              const Social()
            ],
          ),
        ),
      ),
    ));
  }
}
