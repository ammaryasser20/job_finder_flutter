import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gp/core/uitlites/app_theme_class.dart';
import 'package:sizer/sizer.dart';

class MoreOptionItem extends StatelessWidget {
  const MoreOptionItem(
      {super.key,
      required this.text,
      this.icon = null,
      required this.function});
  final String text;
  final String? icon;
  final Function function;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(100),
      onTap: () {
        function();
      },
      child: Container(
        padding: const EdgeInsets.all(10),
        width: 90.w,
        height: 6.h,
        decoration: BoxDecoration(
          border: Border.all(color: AppTheme.neutralColors[300]!),
          borderRadius: BorderRadius.circular(100),
        ),
        child: Row(
          children: [
            if (icon != null)
              SvgPicture.asset(
                icon!,
              ),
            const SizedBox(
              width: 10,
            ),
            Text(
              text,
              style: Theme.of(context).textTheme.displayLarge!.copyWith(
                  color: AppTheme.neutralColors[900],
                  fontWeight: AppTheme.mediumWeight),
            ),
            const Spacer(),
            SvgPicture.asset(
              'assets/images/more_option_Icon/Vector.svg',
            ),
          ],
        ),
      ),
    );
  }
}
