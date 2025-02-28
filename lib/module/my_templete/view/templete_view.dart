import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:resume_maker/controller/templete/controller/templete_controller.dart';
import 'package:resume_maker/res/img_res.dart';
import 'package:resume_maker/res/str_res.dart';
import 'package:resume_maker/style/color.dart';
import 'package:resume_maker/util/extension/spacing.dart';
import 'package:resume_maker/widget/images/svg_asset.dart';
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
                  Container(
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
                      //image:
                    ),
                    child: SizedBox(
                      child: SvgAsset(
                        assetName: ImgRes.icError,
                        color: AppColors.iconColor,
                        widget: 70,
                        height: 70,
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
    );
  }
}
