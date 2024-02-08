import 'package:flutter/material.dart';
import 'package:gp/view/pages/forgot_password/check_your_email.dart';
import 'package:gp/view/pages/forgot_password/create_new_password.dart';
import 'package:gp/view/pages/forgot_password/reset_password.dart';
import 'package:gp/view/widget/default_bottom.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({super.key});

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  PageController controller = PageController(initialPage: 0);
  int activePage = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation:
          FloatingActionButtonLocation.miniCenterFloat,
      floatingActionButton: DefaultBottoom(
          text: activePage == 0
              ? 'Request password reset'
              : activePage == 3 || activePage == 1
                  ? 'Open email app'
                  : 'Reset password',
          function: () {
            setState(() {
              controller.nextPage(
                  duration: const Duration(seconds: 1), curve: Curves.ease);
              if (activePage == 3) {
                Navigator.pop(context);
              }
            });
          }),
      appBar: activePage == 3 || activePage == 1
          ? null
          : AppBar(
              leading: IconButton(
                icon: const Icon(
                  Icons.arrow_back_rounded,
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ),
      body: PageView(
        controller: controller,
        children: [
          ResetPassword(),
          const CheckYourEmail(
            myImage: 'assets/images/Email Ilustration.svg',
            titel: 'Check your Email',
            supTitel: 'We have sent a reset password to your email \n address',
          ),
          CreateNewPassword(),
          const CheckYourEmail(
            myImage: 'assets/images/Password Succesfully Ilustration.svg',
            titel: 'Password changed\nsuccesfully!',
            supTitel:
                'Your password has been changed successfully,\n we will let you know if there are more problems\n with your account',
          ),
        ],
        onPageChanged: (value) {
          setState(() {
            activePage = value;
          });
        },
      ),
    );
  }
}
