import 'package:flutter/material.dart';
import 'package:gp/core/uitlites/app_theme_class.dart';

class EditTextField extends StatelessWidget {
  const EditTextField({
    Key? key,
    required this.controller,
  }) : super(key: key);

  final TextEditingController controller;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(
            color: AppTheme.neutralColors[300]!,
          ),
        ),
        contentPadding: const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: const BorderSide(color: AppTheme.primaryColors)),
      ),
    );
  }
}
