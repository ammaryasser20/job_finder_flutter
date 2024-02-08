import 'package:flutter/material.dart';
import 'package:gp/view/pages/forgot_password/check_your_email.dart';
import 'package:sizer/sizer.dart';

class NotificationApp extends StatelessWidget {
  const NotificationApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Notification'),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 5.w),
        child: const CheckYourEmail(
          myImage: 'assets/images/Notification Ilustration.svg',
          titel: 'No new notifications yet',
          supTitel:
              'You will receive a notification if there is something on your account',
        ),
      ),
    );
  }
}
