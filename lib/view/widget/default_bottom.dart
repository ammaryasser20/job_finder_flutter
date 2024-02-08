import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class DefaultBottoom extends StatelessWidget {
  const DefaultBottoom(
      {Key? key,
      required this.text,
      required this.function,
      this.color = const Color.fromRGBO(51, 102, 255, 1),
      this.fontcolor = Colors.white})
      : super(key: key);
  final String text;
  final Function function;
  final Color color;
  final Color fontcolor;
  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: () {
        function();
      },
      style: OutlinedButton.styleFrom(
          side: BorderSide(color: color),
          fixedSize: Size(85.w, 6.h),
          backgroundColor: color),
      child: Text(
        text,
        style: TextStyle(color: fontcolor),
      ),
    );
  }
}
