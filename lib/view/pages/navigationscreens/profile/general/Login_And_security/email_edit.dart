import 'package:flutter/material.dart';
import 'package:gp/core/uitlites/app_theme_class.dart';
import 'package:gp/view/widget/default_bottom.dart';
import 'package:gp/view/widget/default_text_field.dart';
import 'package:sizer/sizer.dart';

class EmailEdit extends StatelessWidget {
  const EmailEdit({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController controller = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_rounded),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Text(
          'Email address',
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 4.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Main e-mail address',
              style: Theme.of(context)
                  .textTheme
                  .displayLarge!
                  .copyWith(color: AppTheme.neutralColors[900]),
            ),
            const SizedBox(
              height: 5,
            ),
            DefaultTextField(
                prefixIcon: Icons.email_outlined,
                hintText: 'Email',
                controller: controller,
                isForPassword: false,
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
