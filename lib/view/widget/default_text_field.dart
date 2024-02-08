import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gp/controller/textfieldcubit/text_field_cubit.dart';
import 'package:gp/core/uitlites/app_theme_class.dart';

class DefaultTextField extends StatelessWidget {
  const DefaultTextField(
      {super.key,
      required this.prefixIcon,
      required this.hintText,
      required this.controller,
      required this.isForPassword,
      required this.onChanged});
  final bool isForPassword;
  final Function onChanged;
  final IconData prefixIcon;
  final String hintText;
  final TextEditingController controller;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TextFieldCubit, TextFieldState>(
      builder: (context, state) {
        return TextField(
          obscureText: isForPassword
              ? TextFieldCubit.get(context).passwordVisible
              : false,
          onChanged: (value) {
            if (isForPassword) {
              if (value.length < 8) {
                TextFieldCubit.get(context).chandValid(valid: 1);
              } else {
                TextFieldCubit.get(context).chandValid(valid: 2);
              }
            }
            onChanged();
          },
          controller: controller,
          decoration: InputDecoration(
            hintText: hintText,
            hintStyle: Theme.of(context).textTheme.displayMedium,
            prefixIcon: Icon(prefixIcon),
            suffixIcon: isForPassword
                ? IconButton(
                    icon: Icon(TextFieldCubit.get(context).passwordVisible
                        ? Icons.visibility_off
                        : Icons.visibility),
                    onPressed: () {
                      TextFieldCubit.get(context).chandpasswordVisible();
                    },
                  )
                : null,
            suffixIconColor: MaterialStateColor.resolveWith((states) =>
                states.contains(MaterialState.focused)
                    ? AppTheme.neutralColors[900]!
                    : AppTheme.neutralColors[400]!),
            prefixIconColor: MaterialStateColor.resolveWith((states) =>
                states.contains(MaterialState.focused)
                    ? AppTheme.neutralColors[900]!
                    : AppTheme.neutralColors[400]!),
            enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: AppTheme.neutralColors[300]!),
                borderRadius: BorderRadius.circular(8)),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(
                  color: isForPassword
                      ? TextFieldCubit.get(context).isValid == 2
                          ? Theme.of(context).colorScheme.primary
                          : Theme.of(context).colorScheme.onError
                      : Theme.of(context).colorScheme.primary),
            ),
          ),
        );
      },
    );
  }
}
