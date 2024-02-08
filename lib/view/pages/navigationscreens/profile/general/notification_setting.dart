import 'package:flutter/material.dart';
import 'package:gp/core/uitlites/app_theme_class.dart';
import 'package:sizer/sizer.dart';

class NotificationSetting extends StatefulWidget {
  const NotificationSetting({super.key});

  @override
  State<NotificationSetting> createState() => _NotificationSettingState();
}

class _NotificationSettingState extends State<NotificationSetting> {
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
        title: const Text('Notification'),
      ),
      body: Column(
        children: [
          Container(
            width: 100.w,
            padding: const EdgeInsets.only(left: 10, top: 5, bottom: 5),
            decoration: BoxDecoration(
              color: AppTheme.neutralColors[100],
              border: Border.symmetric(
                horizontal: BorderSide(
                  color: AppTheme.neutralColors[200]!,
                ),
              ),
            ),
            child: Text(
              "Job notification",
              style: Theme.of(context).textTheme.displayMedium!.copyWith(
                    color: AppTheme.neutralColors,
                    fontWeight: AppTheme.mediumWeight,
                  ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 1.h),
              child: ListView.separated(
                physics: const NeverScrollableScrollPhysics(),
                itemCount: jobNotification.length,
                itemBuilder: (context, index) {
                  return Row(
                    children: [
                      Text(
                        jobNotification[index],
                        style:
                            Theme.of(context).textTheme.displayLarge!.copyWith(
                                  color: AppTheme.neutralColors[900],
                                ),
                      ),
                      const Spacer(),
                      Switch(
                        value: jobNoti[index],
                        onChanged: (bool value) {
                          setState(() {
                            jobNoti[index] = value;
                          });
                        },
                      )
                    ],
                  );
                },
                separatorBuilder: (BuildContext context, int index) {
                  return Divider(
                    color: AppTheme.neutralColors[300],
                  );
                },
              ),
            ),
          ),
          Container(
            width: 100.w,
            padding: const EdgeInsets.only(left: 10, top: 5, bottom: 5),
            decoration: BoxDecoration(
              color: AppTheme.neutralColors[100],
              border: Border.symmetric(
                horizontal: BorderSide(
                  color: AppTheme.neutralColors[200]!,
                ),
              ),
            ),
            child: Text(
              "Other notification",
              style: Theme.of(context).textTheme.displayMedium!.copyWith(
                    color: AppTheme.neutralColors,
                    fontWeight: AppTheme.mediumWeight,
                  ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 1.h),
              child: ListView.separated(
                physics: const NeverScrollableScrollPhysics(),
                itemCount: otherNotification.length,
                itemBuilder: (context, index) {
                  return Row(
                    children: [
                      Text(
                        otherNotification[index],
                        style:
                            Theme.of(context).textTheme.displayLarge!.copyWith(
                                  color: AppTheme.neutralColors[900],
                                ),
                      ),
                      const Spacer(),
                      Switch(
                        value: otherNot[index],
                        onChanged: (bool value) {
                          setState(() {
                            otherNot[index] = value;
                          });
                        },
                      )
                    ],
                  );
                },
                separatorBuilder: (BuildContext context, int index) {
                  return Divider(
                    color: AppTheme.neutralColors[300],
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}

List<String> jobNotification = [
  'Your Job Search Alert',
  'Job Application Update',
  'Job Application Reminders',
  'Jobs You May Be Interested In',
  'Job Seeker Updates',
];

List<bool> jobNoti = [
  false,
  false,
  false,
  false,
  false,
];
List<String> otherNotification = [
  'Show Profile',
  'All Message',
  'Message Nudges',
];
List<bool> otherNot = [
  false,
  false,
  false,
];
