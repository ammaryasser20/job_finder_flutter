import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gp/controller/usercubit/user_cubit.dart';
import 'package:gp/core/uitlites/app_theme_class.dart';

import 'package:sizer/sizer.dart';

class Language extends StatelessWidget {
  const Language({super.key});

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
        title: const Text('Language'),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 5.h),
        child: ListView.separated(
          itemCount: language.length,
          itemBuilder: (context, index) {
            return Row(
              children: [
                SvgPicture.asset(
                    'assets/images/language_imag/${language[index]}.svg'),
                const SizedBox(
                  width: 10,
                ),
                Text(
                  language[index],
                  style: Theme.of(context).textTheme.displayLarge!.copyWith(
                      color: AppTheme.neutralColors[900],
                      fontWeight: AppTheme.mediumWeight),
                ),
                const Spacer(),
                BlocBuilder<UserCubit, UserState>(
                  builder: (context, state) {
                    return Checkbox(
                      value: UserCubit.get(context).language == language[index],
                      onChanged: (value) {
                        if (value == true) {
                          UserCubit.get(context)
                              .changLanguage(lang: language[index]);
                        } else {
                          UserCubit.get(context).changLanguage(lang: 'English');
                        }
                      },
                      shape: const CircleBorder(),
                    );
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
    );
  }
}

List<String> language = [
  'English',
  'Indonesia',
  'Arabic',
  'Chinese',
  'Dutch',
  'French',
  'German',
  'Japanese',
  'Korean',
  'Portuguese'
];
