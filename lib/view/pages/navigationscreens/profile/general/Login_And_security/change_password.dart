import 'package:flutter/material.dart';
import 'package:gp/core/uitlites/app_theme_class.dart';
import 'package:gp/view/widget/default_bottom.dart';
import 'package:gp/view/widget/default_text_field.dart';
import 'package:sizer/sizer.dart';

class ChangePassword extends StatelessWidget {
  const ChangePassword({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController controller = TextEditingController();
    final TextEditingController controller1 = TextEditingController();
    final TextEditingController controller2 = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Change password',
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 4.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Enter your old password',
              style: Theme.of(context)
                  .textTheme
                  .displayLarge!
                  .copyWith(color: AppTheme.neutralColors[900]),
            ),
            const SizedBox(
              height: 5,
            ),
            DefaultTextField(
                prefixIcon: Icons.lock_rounded,
                hintText: 'old password',
                controller: controller,
                isForPassword: true,
                onChanged: () {}),
            SizedBox(
              height: 2.h,
            ),
            Text(
              'Enter your new password',
              style: Theme.of(context)
                  .textTheme
                  .displayLarge!
                  .copyWith(color: AppTheme.neutralColors[900]),
            ),
            const SizedBox(
              height: 5,
            ),
            DefaultTextField(
                prefixIcon: Icons.lock_rounded,
                hintText: 'new password',
                controller: controller1,
                isForPassword: true,
                onChanged: () {}),
            SizedBox(
              height: 2.h,
            ),
            Text(
              'Confirm your new password',
              style: Theme.of(context)
                  .textTheme
                  .displayLarge!
                  .copyWith(color: AppTheme.neutralColors[900]),
            ),
            const SizedBox(
              height: 5,
            ),
            DefaultTextField(
                prefixIcon: Icons.lock_rounded,
                hintText: 'new password',
                controller: controller2,
                isForPassword: true,
                onChanged: () {}),
            const Spacer(),
            Center(
              child: DefaultBottoom(
                text: 'save',
                function: () {},
              ),
            ),
          ],
        ),
      ),
    );
  }
}
