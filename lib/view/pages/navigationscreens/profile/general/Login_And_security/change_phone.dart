import 'package:flutter/material.dart';
import 'package:gp/core/uitlites/app_theme_class.dart';
import 'package:gp/view/widget/default_bottom.dart';

import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:sizer/sizer.dart';

class ChangePhone extends StatelessWidget {
  const ChangePhone({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController controller = TextEditingController();
    return Scaffold(
      appBar: AppBar(
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
              'Main phone number',
              style: Theme.of(context)
                  .textTheme
                  .displayLarge!
                  .copyWith(color: AppTheme.neutralColors[900]),
            ),
            const SizedBox(
              height: 5,
            ),
            IntlPhoneField(
              decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide(
                    color: AppTheme.neutralColors[300]!,
                  ),
                ),
                contentPadding:
                    const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide:
                        BorderSide(color: AppTheme.primaryColors[300]!)),
              ),
              initialCountryCode: 'EG',
              onChanged: (phone) {
                controller.text = phone.completeNumber;
              },
            ),
            Row(
              children: [
                Text(
                  'Use the phone number to reset your\n password',
                  style: Theme.of(context)
                      .textTheme
                      .displayMedium!
                      .copyWith(color: AppTheme.neutralColors[500]),
                ),
                const Spacer(),
                Switch(
                  value: true,
                  onChanged: (bool value) {},
                )
              ],
            ),
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
