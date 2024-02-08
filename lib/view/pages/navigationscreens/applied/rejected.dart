import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sizer/sizer.dart';

class Rejected extends StatelessWidget {
  const Rejected({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: 100.w,
        child: Column(
          children: [
            SizedBox(
              height: 15.h,
            ),
            SvgPicture.asset('assets/images/Rejected.svg'),
            const SizedBox(
              height: 15,
            ),
            Text(
              'No applications were rejected',
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            SizedBox(
              height: 1.h,
            ),
            Text(
              textAlign: TextAlign.center,
              'If there is an application that is rejected by the\ncompany it will appear here',
              style: Theme.of(context).textTheme.displayLarge,
            )
          ],
        ));
  }
}
