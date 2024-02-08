import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gp/controller/usercubit/user_cubit.dart';
import 'package:gp/core/uitlites/app_theme_class.dart';

class CountrieItem extends StatelessWidget {
  const CountrieItem({super.key, required this.country});
  final String country;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: InkWell(
        borderRadius: BorderRadius.circular(100),
        onTap: () {
          if (!UserCubit.get(context).userCountry.contains(country)) {
            UserCubit.get(context).addCountry(country: country);
          } else {
            UserCubit.get(context).removeCountry(country: country);
          }
        },
        child: BlocBuilder<UserCubit, UserState>(
          builder: (context, state) {
            return Container(
              padding: const EdgeInsetsDirectional.all(7),
              decoration: BoxDecoration(
                  color: UserCubit.get(context).userCountry.contains(country)
                      ? AppTheme.primaryColors[100]
                      : AppTheme.neutralColors[100],
                  borderRadius: BorderRadius.circular(100),
                  border: Border.all(
                    color: UserCubit.get(context).userCountry.contains(country)
                        ? Theme.of(context).colorScheme.primary
                        : AppTheme.neutralColors[200]!,
                  )),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SvgPicture.asset(
                    "assets/images/Flags/$country.svg",
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Text(country)
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
