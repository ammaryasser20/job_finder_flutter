import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sizer/sizer.dart';

class CheckYourEmail extends StatelessWidget {
  const CheckYourEmail(
      {super.key,
      required this.myImage,
      required this.titel,
      required this.supTitel});
  final String myImage;
  final String titel;
  final String supTitel;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SvgPicture.asset(myImage),
        SizedBox(
          height: 2.h,
        ),
        Text(titel,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.headlineSmall),
        SizedBox(
          height: 1.h,
        ),
        Text(supTitel,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.displayLarge)
      ],
    );
  }
}
