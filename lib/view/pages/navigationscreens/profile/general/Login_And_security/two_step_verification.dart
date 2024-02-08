import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gp/core/uitlites/app_route.dart';
import 'package:gp/core/uitlites/app_theme_class.dart';
import 'package:gp/view/widget/default_bottom.dart';
import 'package:sizer/sizer.dart';

class TwoStepVerification extends StatefulWidget {
  const TwoStepVerification({super.key});

  @override
  State<TwoStepVerification> createState() => _TwoStepVerificationState();
}

class _TwoStepVerificationState extends State<TwoStepVerification> {
  late PageController controller;
  @override
  void initState() {
    super.initState();
    controller = PageController(initialPage: 0);
  }

  bool mySwitch = false;
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
        title: const Text(
          'Two-step verification',
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 5.w),
        child: Column(children: [
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              border: Border.all(color: AppTheme.neutralColors[300]!),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    'Secure your account with two-step verification',
                    style: Theme.of(context)
                        .textTheme
                        .displayLarge!
                        .copyWith(fontWeight: AppTheme.mediumWeight),
                  ),
                ),
                Switch(
                    value: mySwitch,
                    onChanged: (value) {
                      setState(() {
                        mySwitch = value;
                      });
                    })
              ],
            ),
          ),
          SizedBox(
            height: 3.h,
          ),
          Expanded(
            child: PageView(
              controller: controller,
              children: const [FistPage(), SecondePage()],
            ),
          ),
          DefaultBottoom(
              text: 'Next',
              function: () {
                if (controller.page == 0) {
                  controller.nextPage(
                      duration: const Duration(seconds: 1), curve: Curves.ease);
                } else {
                  Navigator.pushNamed(context, AppRoute.twoStepVerification2);
                }
              }),
          const SizedBox(
            height: 40,
          ),
        ]),
      ),
    );
  }
}

class FistPage extends StatelessWidget {
  const FistPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          leading:
              SvgPicture.asset('assets/images/Two-step verification (1).svg'),
          subtitle: Text(
            'Two-step verification provides additional security by asking for a verification code every time you log in on another device.',
            style: Theme.of(context)
                .textTheme
                .displayMedium!
                .copyWith(color: AppTheme.neutralColors),
          ),
        ),
        ListTile(
          leading:
              SvgPicture.asset('assets/images/Two-step verification (2).svg'),
          subtitle: Text(
            'Adding a phone number or using an authenticator will help keep your account safe from harm.',
            style: Theme.of(context)
                .textTheme
                .displayMedium!
                .copyWith(color: AppTheme.neutralColors),
          ),
        ),
        const Spacer(),
      ],
    );
  }
}

class SecondePage extends StatefulWidget {
  const SecondePage({super.key});

  @override
  State<SecondePage> createState() => _SecondePageState();
}

class _SecondePageState extends State<SecondePage> {
  String initValue = 'Telephone number (SMS)';
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Select a verification method',
          style: Theme.of(context)
              .textTheme
              .displayLarge!
              .copyWith(color: AppTheme.neutralColors[900]),
        ),
        DropdownButton(
          
            isExpanded: true,
            value: initValue,
            items: const [
              DropdownMenuItem(
                value: 'Telephone number (SMS)',
                child: Text('Telephone number (SMS)'),
              ),
              DropdownMenuItem(
                value: 'Email',
                child: Text('Email'),
              )
            ],
            onChanged: (value) {
              setState(() {
                initValue = value!;
              });
            }),
        Text(
          'Note : Turning this feature will sign you out anywhere you’re currently signed in. We will then require you to enter a verification code the first time you sign with a new device or Joby mobile application.',
          style: Theme.of(context)
              .textTheme
              .displayMedium!
              .copyWith(color: AppTheme.neutralColors[500]),
        )
      ],
    );
  }
}
