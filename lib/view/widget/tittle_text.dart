import 'package:flutter/material.dart';
import 'package:gp/core/uitlites/app_theme_class.dart';

class TittelText extends StatelessWidget {
  const TittelText({super.key, required this.tittel});
  final String tittel;
  @override
  Widget build(BuildContext context) {
    return Text(tittel,
        style: Theme.of(context).textTheme.displayLarge!.copyWith(
            color: AppTheme.neutralColors[900],
            fontWeight: AppTheme.mediumWeight));
  }
}
