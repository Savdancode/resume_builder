import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:resume_maker/controller/templete/controller/templete_controller.dart';
import 'package:resume_maker/res/img_res.dart';
import 'package:resume_maker/res/str_res.dart';
import 'package:resume_maker/service/templete/templete.dart';
import 'package:resume_maker/style/color.dart';
import 'package:resume_maker/util/extension/spacing.dart';
import 'package:resume_maker/widget/button/custom_elevated_button.dart';
import 'package:resume_maker/widget/text_field/custom_text_form.dart';

class TempleteView extends StatelessWidget {
  const TempleteView({super.key});

  static final TempleteController templateController =
      Get.find<TempleteController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Templete View"),
      ),
      body: ListView(
        padding: const EdgeInsets.all(7),
        children: <Widget>[
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Stack(
                alignment: Alignment.topRight,
                children: [
                  GestureDetector(
                    onTap: templateController.pickImage,
                    child: Obx(
                      () => Container(
                        alignment: Alignment.center,
                        width: Get.width * 0.25,
                        height: Get.width * 0.25,
                        decoration: BoxDecoration(
                          color: AppColors.scaffoldBackgroundColor,
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: AppColors.tertiaryColor,
                            width: 1.0, // Border width
                          ),
                          image: DecorationImage(
                            image: templateController.image.value == null
                                ? const AssetImage(
                                    ImgRes.icErrorImage,
                                  )
                                : FileImage(
                                    File(
                                      templateController.image.value!.path,
                                    ), // Convert XFile to File
                                  ),
                            fit: BoxFit.cover,
                          ),
                          //image:
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    right: 10,
                    child: Container(
                      padding: const EdgeInsets.all(5),
                      decoration: BoxDecoration(
                        color: AppColors.tertiaryColor,
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(
                        Icons.edit,
                        size: 20,
                      ),
                    ),
                  )
                ],
              ),
              10.horizontalGap,
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    CustomTextForm(
                      hint: StrRes.firstName,
                      useLabel: true,
                      controller: templateController.txtFirstName,
                    ),
                    10.verticalGap,
                    CustomTextForm(
                      hint: StrRes.lastName,
                      useLabel: true,
                      controller: templateController.txtLastName,
                    )
                  ],
                ),
              ),
            ],
          ),
          CustomTextForm(
            controller: templateController.txtPosition,
            title: StrRes.position,
            hint: StrRes.position,
            boxConstraints: const BoxConstraints(
              minHeight: 40,
              maxHeight: 50,
              maxWidth: 300,
              minWidth: 200,
            ),
          ),
        ],
      ),
      bottomNavigationBar: Container(
        margin: const EdgeInsets.all(10),
        height: 40.h,
        child: CustomElevatedButton(
          titleStyle: const TextStyle(
            fontSize: 16,
            color: Colors.white,
          ),
          title: StrRes.buildNow,
          onPressed: () async {
            await templateController.generateData();
            TempleteService.savePDF(
              templateController.resumeDetails,
            );
          },
        ),
      ),
    );
  }
}
