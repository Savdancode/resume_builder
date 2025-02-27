import 'package:flutter/material.dart';
import 'package:resume_maker/style/color.dart';
import 'package:resume_maker/util/extension/str_to_text.dart';

class CustomElevatedButton extends StatelessWidget {
  final String title;
  final ButtonStyle? buttonStyleButton;
  final Function()? onPressed;
  const CustomElevatedButton({
    super.key,
    this.title = 'title',
    this.buttonStyleButton,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: buttonStyleButton ??
          ElevatedButton.styleFrom(
            fixedSize: const Size(100, 20),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
      onPressed: onPressed,
      child: title.toText(
        style: TextStyle(
          fontSize: 12,
          color: AppColors.txtColor,
        ),
      ),
    );
  }
}
