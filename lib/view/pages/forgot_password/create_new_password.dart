import 'package:flutter/material.dart';
import 'package:gp/core/uitlites/app_theme_class.dart';
import 'package:gp/view/widget/default_text_field.dart';
import 'package:sizer/sizer.dart';

class CreateNewPassword extends StatelessWidget {
  CreateNewPassword({super.key});
  final TextEditingController controllerOne = TextEditingController();
  final TextEditingController controllerTwo = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 5.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Create new password',
              style: Theme.of(context).textTheme.headlineMedium),
          SizedBox(
            height: 1.h,
          ),
          Text('Set your new password so you can login and\nacces Jobsque',
              style: Theme.of(context).textTheme.displayLarge),
          SizedBox(
            height: 5.h,
          ),
          DefaultTextField(
              prefixIcon: Icons.lock,
              hintText: 'new password',
              controller: controllerOne,
              isForPassword: true,
              onChanged: () {}),
          SizedBox(
            height: 10,
          ),
          Text(
            'Password must be at least 8 characters',
            style: Theme.of(context).textTheme.displayLarge!.copyWith(
                  color: AppTheme.neutralColors[400],
                ),
          ),
          SizedBox(
            height: 20,
          ),
          DefaultTextField(
              prefixIcon: Icons.lock,
              hintText: 'new password',
              controller: controllerTwo,
              isForPassword: true,
              onChanged: () {}),
          SizedBox(
            height: 10,
          ),
          Text(
            'Both password must match',
            style: Theme.of(context).textTheme.displayLarge!.copyWith(
                  color: AppTheme.neutralColors[400],
                ),
          ),
        ],
      ),
    );
  }
}
