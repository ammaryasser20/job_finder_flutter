import 'package:flutter/material.dart';
import 'package:gp/core/uitlites/app_theme_class.dart';

import 'package:gp/view/pages/navigationscreens/applied/completed.dart';
import 'package:gp/view/pages/navigationscreens/applied/rejected.dart';
import 'package:gp/view/pages/navigationscreens/applied/uncompleted.dart';
import 'package:sizer/sizer.dart';
import 'package:toggle_switch/toggle_switch.dart';

class AppliedScreen extends StatelessWidget {
  const AppliedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    PageController controller = PageController(initialPage: 0);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Applied Job'),
        centerTitle: true,
      ),
      body: SizedBox(
        width: 100.w,
        height: 100.h - kToolbarHeight,
        child: Column(children: [
          const SizedBox(
            height: 20,
          ),
          Center(
            child: ToggleSwitch(
              minWidth: 29.w,
              initialLabelIndex: 0,
              cornerRadius: 20.0,
              totalSwitches: 3,
              inactiveBgColor: AppTheme.neutralColors[100],
              activeBgColor: [AppTheme.primaryColors[900]!],
              radiusStyle: true,
              labels: const ['uncompleted', 'completed', 'Rejected'],
              onToggle: (index) {
                controller.animateToPage(index!,
                    duration: const Duration(seconds: 1), curve: Curves.ease);
              },
            ),
          ),
          SizedBox(
            height: 3.h,
          ),
          Expanded(
            child: ListView(
              physics: const NeverScrollableScrollPhysics(),
              controller: controller,
              scrollDirection: Axis.horizontal,
              children: const [UnCompleted(), Completed(), Rejected()],
            ),
          ),
        ]),
      ),
    );
  }
}
