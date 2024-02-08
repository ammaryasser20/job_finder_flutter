import 'package:flutter/material.dart';
import 'package:gp/core/uitlites/app_theme_class.dart';
import 'package:sizer/sizer.dart';

class TypeOfWork extends StatefulWidget {
  const TypeOfWork({super.key, required this.work});
  final String work;

  @override
  State<TypeOfWork> createState() => _TypeOfWorkState();
}

class _TypeOfWorkState extends State<TypeOfWork> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 5.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Type of work',
            style: Theme.of(context).textTheme.titleLarge!,
          ),
          const SizedBox(
            height: 3,
          ),
          Text(
            'Fill in your bio data correctly',
            style: Theme.of(context).textTheme.displayMedium!,
          ),
          const SizedBox(
            height: 20,
          ),
          Container(
            padding: const EdgeInsets.all(10),
            width: double.infinity,
            height: 10.h,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: AppTheme.neutralColors[300]!),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.work,
                  style:
                      TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w500),
                ),
                const SizedBox(
                  height: 5,
                ),
                Text(
                  'CV.pdf • Portfolio.pdf',
                  style: Theme.of(context).textTheme.displayMedium!.copyWith(
                      color: AppTheme.neutralColors,
                      fontWeight: AppTheme.mediumWeight),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
