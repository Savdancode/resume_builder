import 'package:flutter/material.dart';
import 'package:resume_maker/res/str_res.dart';

import '../../style/color.dart';

class CustomTextForm extends StatelessWidget {
  const CustomTextForm({super.key});
  static final _border = OutlineInputBorder(
    borderRadius: BorderRadius.circular(10.0),
    borderSide: const BorderSide(
      color: Colors.grey, // Default border color
      width: 0.7,
    ),
  );
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      cursorColor: AppColors.tertiaryColor,
      style: const TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.w500,
      ),
      decoration: InputDecoration(
        fillColor: Colors.grey[200],
        filled: true,
        contentPadding: const EdgeInsets.all(10),
        hintText: StrRes.firstName,
        hintStyle: TextStyle(
          fontSize: 14,
          color: AppColors.txtColor.withAlpha(100),
        ),
        border: _border,
        enabledBorder: _border,
        focusedBorder: _border,
        constraints: const BoxConstraints(
          minHeight: 40,
          maxHeight: 50,
        ),
      ),
    );
  }
}
