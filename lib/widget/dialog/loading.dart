import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:resume_maker/style/color.dart';
import 'package:resume_maker/style/style.dart';

class LoadingDialog {
  static final RxInt _dotCount = 0.obs;

  static void show({String message = "loading"}) {
    _dotCount.value = 0; // Reset animation

    // Start dot animation loop
    ever(_dotCount, (_) async {
      while (Get.isDialogOpen ?? false) {
        await Future.delayed(const Duration(milliseconds: 500));
        _dotCount.value = (_dotCount.value + 1) % 4; // Cycle: 0 → 1 → 2 → 3 → 0
      }
    });

    Get.dialog(
      PopScope(
        canPop: false, // Prevent manual closing
        child: Center(
          child: Container(
            height: 70.h, // Responsive size
            width: 70.h,
            decoration: BoxDecoration(
              color: AppColors.backGroundColor,
              borderRadius: BorderRadius.circular(10),
              boxShadow: AppStyle.boxShadow,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Native OS Loading Indicator
                GetPlatform.isIOS
                    ? CupertinoActivityIndicator(
                        radius: 12.w,
                        color: AppColors.txtColor,
                      )
                    : SizedBox(
                        height: 20.h,
                        width: 20.h,
                        child: CircularProgressIndicator(
                          strokeWidth: 2,
                          backgroundColor: Colors.grey[200],
                        ),
                      ),
                SizedBox(height: 8.h), // Spacing
                // ✅ Fixed Animated Dots
                Material(
                  color: Colors.transparent,
                  child: Text(
                    message, // Proper dot animation
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: AppColors
                          .txtColor, // Keep text visible on dark background
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
      barrierDismissible: false, // Prevent accidental dismissal
      barrierColor: Colors.transparent, // ✅ Remove background dim effect
    );
  }

  static void hide() {
    if (Get.isDialogOpen ?? false) {
      Get.back();
    }
  }
}
