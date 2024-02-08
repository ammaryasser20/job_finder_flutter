import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

import 'package:gp/controller/searchcubit/search_cubit.dart';
import 'package:gp/core/uitlites/app_theme_class.dart';

class Searchfiled extends StatelessWidget {
  const Searchfiled({
    Key? key,
    required this.onTap,
    required this.readOnly,
    required this.height,
    required this.width,
    required this.controller,
    required this.hintText,
    required this.onSubmitted,
  }) : super(key: key);
  final Function onTap;
  final String hintText;
  final bool readOnly;
  final double height;
  final double width;
  final Function(String) onSubmitted;
  final TextEditingController controller;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
      child: BlocBuilder<SearchCubit, SearchState>(
        builder: (context, state) {
          return TextField(
            onSubmitted: (value) {
              onSubmitted(value);
            },
            controller: controller,
            onTap: () {
              onTap();
            },
            onChanged: (value) {
              if (value.isEmpty) {
                SearchCubit.get(context).changeIsEmpty(value: true);
              } else {
                SearchCubit.get(context).changeIsEmpty(value: false);
              }
            },
            readOnly: readOnly,
            decoration: InputDecoration(
              suffixIcon: SearchCubit.get(context).isEmpty
                  ? null
                  : IconButton(
                      icon: const Icon(Icons.highlight_remove_sharp),
                      onPressed: () {
                        controller.clear();
                        SearchCubit.get(context).changeIsEmpty(value: true);
                      },
                    ),
              hintStyle: Theme.of(context).textTheme.displayMedium,
              hintText: hintText,
              prefixIcon: SvgPicture.asset(
                'assets/images/search.svg',
                width: 20,
                height: 20,
                fit: BoxFit.none,
              ),
              contentPadding: const EdgeInsets.all(10),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: AppTheme.neutralColors[300]!),
                borderRadius: BorderRadius.circular(100),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: AppTheme.neutralColors[300]!),
                borderRadius: BorderRadius.circular(100),
              ),
            ),
          );
        },
      ),
    );
  }
}
