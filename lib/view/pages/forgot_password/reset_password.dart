import 'package:flutter/material.dart';
import 'package:gp/core/uitlites/app_route.dart';
import 'package:gp/core/uitlites/app_theme_class.dart';
import 'package:gp/view/widget/default_text_field.dart';
import 'package:sizer/sizer.dart';

class ResetPassword extends StatelessWidget {
  ResetPassword({super.key});
  final TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 2.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Reset Password',
            style: Theme.of(context).textTheme.headlineMedium,
          ),
          SizedBox(
            height: 1.h,
          ),
          Text(
            'Enter the email address you used when you joined and we’ll send you instructions to reset your password.',
            style: Theme.of(context).textTheme.displayLarge,
          ),
          SizedBox(
            height: 5.h,
          ),
          DefaultTextField(
              prefixIcon: Icons.email,
              hintText: 'Enter your email....',
              controller: controller,
              isForPassword: false,
              onChanged: () {}),
          Spacer(),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "You remember your password",
                style: Theme.of(context).textTheme.displayMedium,
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
                        .copyWith(color: AppTheme.primaryColors),
                  ))
            ],
          ),
          SizedBox(
            height: 7.h,
          )
        ],
      ),
    );
  }
}
