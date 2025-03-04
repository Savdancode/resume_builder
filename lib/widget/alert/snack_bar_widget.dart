import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:resume_maker/style/color.dart';
import 'package:resume_maker/widget/alert/alert_snack_bar.dart';

class SnackbarWidget extends StatelessWidget {
  const SnackbarWidget({
    super.key,
    required this.message,
    required this.snackbar,
    required this.cancel,
    required this.title,
  });
  final String message;
  final String title;

  final Function() cancel;
  final SnackBarStatus snackbar;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(
        horizontal: 15,
        vertical: 10,
      ),
      decoration: BoxDecoration(
        color: snackbar == SnackBarStatus.success
            ? Colors.green
            : HexColor('EF5555'),
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.white.withAlpha(100),
            offset: const Offset(1, 1),
            blurRadius: 5,
          )
        ],
      ),
      margin: const EdgeInsets.symmetric(
        horizontal: 15,
        vertical: 10,
      ),
      child: Row(
        children: [
          GestureDetector(
            onTap: () {
              cancel();
            },
            child: Icon(
              Icons.close,
              color: AppColors.backGroundColor,
            ),
          ),
          const SizedBox(width: 10),
          Flexible(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                if (title.isNotEmpty)
                  Text(
                    title,
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                    ),
                  ),
                Text(
                  message,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 13,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
