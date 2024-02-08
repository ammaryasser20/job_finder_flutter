import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gp/const.dart';
import 'package:gp/controller/textfieldcubit/text_field_cubit.dart';
import 'package:gp/controller/usercubit/user_cubit.dart';
import 'package:gp/core/uitlites/app_route.dart';
import 'package:gp/core/uitlites/app_theme_class.dart';
import 'package:gp/view/widget/default_bottom.dart';
import 'package:gp/view/widget/default_text_field.dart';
import 'package:gp/view/widget/social_login.dart';
import 'package:sizer/sizer.dart';
import 'package:text_divider/text_divider.dart';

class CreateAccount extends StatelessWidget {
  const CreateAccount({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(right: 6.w, left: 6.w),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: const Icon(
                        Icons.arrow_back,
                      ),
                    ),
                    const Spacer(),
                    SvgPicture.asset(
                      'assets/images/Logo.svg',
                      width: 25.w,
                    )
                  ],
                ),
                SizedBox(
                  height: 6.h,
                ),
                Text(
                  'Create Account',
                  style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                        fontWeight: AppTheme.mediumWeight,
                      ),
                ),
                Text(
                  "Please create an account to find your dream job",
                  style: Theme.of(context).textTheme.displayLarge,
                ),
                SizedBox(
                  height: 5.h,
                ),
                DefaultTextField(
                  prefixIcon: Icons.person,
                  hintText: "Username",
                  controller: userNameCon,
                  isForPassword: false,
                  onChanged: TextFieldCubit.get(context).isAllOKRegister,
                ),
                SizedBox(
                  height: 2.h,
                ),
                DefaultTextField(
                  prefixIcon: Icons.email,
                  hintText: "Email",
                  controller: emailCon,
                  isForPassword: false,
                  onChanged: TextFieldCubit.get(context).isAllOKRegister,
                ),
                SizedBox(
                  height: 2.h,
                ),
                DefaultTextField(
                  prefixIcon: Icons.lock,
                  hintText: "Password",
                  controller: passCon,
                  isForPassword: true,
                  onChanged: TextFieldCubit.get(context).isAllOKRegister,
                ),
                SizedBox(
                  height: 1.h,
                ),
                BlocBuilder<TextFieldCubit, TextFieldState>(
                  builder: (context, state) {
                    return Text(
                      "Password must be at least 8 characters",
                      style: TextStyle(
                          fontSize: AppTheme.displayLarge,
                          color: TextFieldCubit.get(context).isValid == 0
                              ? AppTheme.neutralColors[400]
                              : TextFieldCubit.get(context).isValid == 1
                                  ? Theme.of(context).colorScheme.onError
                                  : Theme.of(context).colorScheme.tertiary),
                    );
                  },
                ),
                SizedBox(
                  height: 10.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Already have an account?",
                      style: Theme.of(context)
                          .textTheme
                          .displayMedium!
                          .copyWith(fontWeight: AppTheme.mediumWeight),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.pushReplacementNamed(
                            context, AppRoute.loginScreen);
                      },
                      child: Text(
                        "Login",
                        style: Theme.of(context)
                            .textTheme
                            .displayMedium!
                            .copyWith(
                                color: Theme.of(context).primaryColor,
                                fontWeight: AppTheme.mediumWeight),
                      ),
                    )
                  ],
                ),
                BlocBuilder<TextFieldCubit, TextFieldState>(
                  builder: (context, state) {
                    return Center(
                      child: DefaultBottoom(
                        text: "Create account",
                        function: TextFieldCubit.get(context).isAllNotEmpty &&
                                passCon.text.length > 8
                            ? () async {
                                if (emailCon.text.contains("@")) {
                                  if (await UserCubit.get(context).register(
                                      name: userNameCon.text.trim(),
                                      email: emailCon.text.trim(),
                                      pass: passCon.text.trim())) {
                                    Navigator.pushReplacementNamed(
                                        context, AppRoute.createAcc2);
                                  } else
                                    ScaffoldMessenger.of(context).showSnackBar(
                                        SnackBar(
                                            content: Text(UserCubit.get(context)
                                                .massage!
                                                .massage!)));
                                } else
                                  ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                          content: Text(
                                              "The email field must be a valid email address")));
                              }
                            : () {},
                        color: TextFieldCubit.get(context).isAllNotEmpty
                            ? Theme.of(context).colorScheme.primary
                            : AppTheme.neutralColors[300]!,
                        fontcolor: TextFieldCubit.get(context).isAllNotEmpty
                            ? Colors.white
                            : const Color.fromRGBO(107, 114, 128, 1),
                      ),
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
      ),
    );
  }
}
