import 'package:flutter/material.dart';
import 'package:gp/core/uitlites/app_theme_class.dart';
import 'package:gp/view/widget/default_bottom.dart';
import 'package:gp/view/widget/default_text_field.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:otp_text_field/otp_field.dart';
import 'package:otp_text_field/style.dart';
import 'package:sizer/sizer.dart';

class TwoStepVerification2 extends StatelessWidget {
  TwoStepVerification2({super.key});
  final PageController controller = PageController(initialPage: 0);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_rounded),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          centerTitle: true,
          title: const Text('Two-step verification'),
        ),
        body: Column(
          children: [
            Expanded(
              child: PageView(
                controller: controller,
                children: [ScreenForPhone(), const OTPScreen()],
              ),
            ),
            DefaultBottoom(
                text: 'Send Code',
                function: () {
                  if (controller.page == 0) {
                    controller.nextPage(
                        duration: const Duration(seconds: 1),
                        curve: Curves.ease);
                  }
                }),
            SizedBox(
              height: 4.h,
            )
          ],
        ));
  }
}

class ScreenForPhone extends StatelessWidget {
  ScreenForPhone({super.key});
  final TextEditingController controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 5.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Add phone number',
            style: Theme.of(context).textTheme.displayLarge!.copyWith(
                color: AppTheme.neutralColors[900],
                fontWeight: AppTheme.mediumWeight),
          ),
          const SizedBox(
            height: 5,
          ),
          Text(
            'We will send a verification code to this number',
            style: Theme.of(context)
                .textTheme
                .displayMedium!
                .copyWith(color: AppTheme.neutralColors[500]),
          ),
          const SizedBox(
            height: 20,
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
                borderSide: BorderSide(color: AppTheme.primaryColors[300]!),
              ),
            ),
            initialCountryCode: 'EG',
            onChanged: (phone) {},
          ),
          const SizedBox(
            height: 20,
          ),
          Text(
            'Enter your password',
            style: Theme.of(context).textTheme.displayLarge!.copyWith(
                color: AppTheme.neutralColors[900],
                fontWeight: AppTheme.mediumWeight),
          ),
          const SizedBox(
            height: 10,
          ),
          DefaultTextField(
              prefixIcon: Icons.lock,
              hintText: 'password',
              controller: controller,
              isForPassword: true,
              onChanged: () {}),
        ],
      ),
    );
  }
}

class OTPScreen extends StatelessWidget {
  const OTPScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 5.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Enter the 6 digit code',
            style: Theme.of(context).textTheme.displayLarge!.copyWith(
                color: AppTheme.neutralColors[900],
                fontWeight: AppTheme.mediumWeight),
          ),
          SizedBox(
            height: 1.h,
          ),
          Text(
            'Please confirm your account by entering the authorization code sen to ****-****-7234',
            style: Theme.of(context).textTheme.displayMedium!.copyWith(
                  color: AppTheme.neutralColors[500],
                ),
          ),
          SizedBox(
            height: 2.h,
          ),
          OTPTextField(
            length: 5,
            width: MediaQuery.of(context).size.width,
            fieldWidth: 15.w,
            style: const TextStyle(fontSize: 17),
            textFieldAlignment: MainAxisAlignment.spaceAround,
            fieldStyle: FieldStyle.box,
            onChanged: (value) {},
            onCompleted: (pin) {},
          ),
        ],
      ),
    );
  }
}
