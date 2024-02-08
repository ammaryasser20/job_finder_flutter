import 'package:flutter/material.dart';
import 'package:gp/const.dart';
import 'package:gp/core/uitlites/app_theme_class.dart';
import 'package:gp/view/widget/default_text_field.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:sizer/sizer.dart';

class Biodata extends StatelessWidget {
  const Biodata({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 5.w),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Biodata',
              style: Theme.of(context).textTheme.titleLarge!,
            ),
            const SizedBox(
              height: 3,
            ),
            Text(
              'Fill in your bio data correctly',
              style: Theme.of(context).textTheme.displayMedium!,
            ),
            const SizedBox(
              height: 20,
            ),
            RichText(
              text: TextSpan(
                style: Theme.of(context).textTheme.displayLarge!,
                children: [
                  TextSpan(
                      text: 'Full Name',
                      style: TextStyle(color: AppTheme.neutralColors[900])),
                  const TextSpan(
                    text: '*',
                    style: TextStyle(
                      color: AppTheme.dangerColors,
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            DefaultTextField(
                prefixIcon: Icons.person,
                hintText: 'Full Name',
                controller: fullNameCon,
                isForPassword: false,
                onChanged: () {}),
            const SizedBox(
              height: 20,
            ),
            RichText(
              text: TextSpan(
                style: Theme.of(context).textTheme.displayLarge!,
                children: [
                  TextSpan(
                      text: 'Email',
                      style: TextStyle(color: AppTheme.neutralColors[900])),
                  const TextSpan(
                    text: '*',
                    style: TextStyle(color: AppTheme.dangerColors),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            DefaultTextField(
                prefixIcon: Icons.person,
                hintText: 'Email',
                controller: emailCon,
                isForPassword: false,
                onChanged: () {}),
            const SizedBox(
              height: 20,
            ),
            RichText(
              text: TextSpan(
                style: Theme.of(context).textTheme.displayLarge!,
                children: [
                  TextSpan(
                      text: 'No.Handphone',
                      style: TextStyle(color: AppTheme.neutralColors[900])),
                  const TextSpan(
                    text: '*',
                    style: TextStyle(color: AppTheme.dangerColors),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            IntlPhoneField(
              initialValue: handphoneCon.text,
              decoration: const InputDecoration(
                focusedBorder: OutlineInputBorder(),
                border: OutlineInputBorder(
                  borderSide: BorderSide(),
                ),
              ),
              initialCountryCode: 'EG',
              onChanged: (phone) {
                handphoneCon.text = phone.completeNumber;
              },
            )
          ],
        ),
      ),
    );
  }
}
