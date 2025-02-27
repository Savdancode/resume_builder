import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:resume_maker/res/img_res.dart';
import 'package:resume_maker/res/str_res.dart';
import 'package:resume_maker/style/color.dart';
import 'package:resume_maker/util/extension/spacing.dart';
import 'package:resume_maker/widget/images/svg_asset.dart';
import 'package:resume_maker/widget/text_field/custom_text_form.dart';

class TempleteView extends StatelessWidget {
  const TempleteView({super.key});

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
            children: [
              Stack(
                alignment: Alignment.topRight,
                children: [
                  Container(
                    alignment: Alignment.center,
                    width: Get.width * 0.3,
                    height: Get.width * 0.3,
                    decoration: BoxDecoration(
                      color: AppColors.scaffoldBackgroundColor,
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: AppColors.tertiaryColor,
                        width: 3.0, // Border width
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
                    right: 15,
                    child: Container(
                      padding: const EdgeInsets.all(5),
                      decoration: BoxDecoration(
                        color: AppColors.tertiaryColor,
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(
                        Icons.edit,
                        size: 30,
                      ),
                    ),
                  )
                ],
              ),
              10.horizontalGap,
              Expanded(
                child: Column(
                  children: [
                    CustomTextForm(),
                    10.verticalGap,
                    CustomTextForm()
                  ],
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
