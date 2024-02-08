import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gp/const.dart';
import 'package:gp/core/uitlites/app_theme_class.dart';

class GrafSelectItems extends StatelessWidget {
  const GrafSelectItems(
      {super.key, required this.index, required this.isSelected});
  final int index;
  final bool isSelected;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 20, left: 15),
      decoration: BoxDecoration(
          boxShadow: const [
            BoxShadow(
              color: Color.fromRGBO(15, 23, 42, 0.12),
              blurRadius: 50,
              offset: Offset(0, 14), // Shadow position
            )
          ],
          color: isSelected
              ? AppTheme.primaryColors[100]
              : AppTheme.neutralColors[100],
          border: Border.all(
            color: isSelected
                ? Theme.of(context).colorScheme.primary
                : AppTheme.neutralColors[300]!,
            width: 1.5,
          ),
          borderRadius: BorderRadius.circular(12)),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Container(
          padding: const EdgeInsets.all(10),
          width: 50,
          height: 50,
          decoration: BoxDecoration(
              color: AppTheme.neutralColors[100],
              borderRadius: BorderRadius.circular(100),
              border: Border.all(
                color: isSelected
                    ? Theme.of(context).colorScheme.primary
                    : AppTheme.neutralColors[300]!,
              )),
          child: SvgPicture.asset(
            "assets/images/$index${isSelected ? 2 : 1}.svg",
            color: isSelected ? Theme.of(context).colorScheme.primary : null,
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        Text(jops[index])
      ]),
    );
  }
}
