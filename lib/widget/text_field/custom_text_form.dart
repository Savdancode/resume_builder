import 'package:flutter/material.dart';
import 'package:resume_maker/res/str_res.dart';
import 'package:resume_maker/util/extension/spacing.dart';

import '../../style/color.dart';

class CustomTextForm extends StatelessWidget {
  final String? hint, label;
  final TextEditingController? controller;
  final bool useLabel;
  final String? title;
  final BoxConstraints? boxConstraints;
  const CustomTextForm(
      {super.key,
      this.hint,
      this.label,
      this.controller,
      this.useLabel = false,
      this.boxConstraints,
      this.title});
  static final _border = OutlineInputBorder(
    borderRadius: BorderRadius.circular(10.0),
    borderSide: BorderSide(
      color: Colors.grey.withAlpha(100), // Default border color
      width: 0.5,
    ),
  );
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        title == null
            ? 0.verticalGap
            : Text(
                title ?? "",
                style: const TextStyle(
                  fontSize: 16,
                ),
              ),
        5.verticalGap,
        TextFormField(
          controller: controller,
          cursorColor: AppColors.tertiaryColor,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w400,
          ),
          textCapitalization: TextCapitalization.sentences,
          decoration: InputDecoration(
            fillColor: AppColors.scaffoldBackgroundColor.withAlpha(100),
            filled: true,
            contentPadding: const EdgeInsets.all(10),
            hintText: hint,
            label: label == null && useLabel == false
                ? null
                : Text(
                    label ?? hint ?? "",
                    style: TextStyle(
                      //  fontSize: ,
                      fontSize: 14,
                      color: AppColors.txtColor,
                    ),
                  ),
            hintStyle: TextStyle(
              fontSize: 14,
              color: AppColors.txtColor.withAlpha(150),
              fontWeight: FontWeight.w400,
            ),
            border: _border,
            enabledBorder: _border,
            focusedBorder: _border,
            constraints: boxConstraints ??
                const BoxConstraints(
                  minHeight: 40,
                  maxHeight: 50,
                ),
          ),
        ),
      ],
    );
  }
}
