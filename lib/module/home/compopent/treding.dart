import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:resume_maker/res/img_res.dart';
import 'package:resume_maker/res/str_res.dart';
import 'package:resume_maker/service/templete/templete.dart';
import 'package:resume_maker/style/color.dart';
import 'package:resume_maker/style/style.dart';
import 'package:resume_maker/util/extension/append_str_on_text.dart';
import 'package:resume_maker/util/extension/spacing.dart';
import 'package:resume_maker/util/extension/str_to_text.dart';
import 'package:resume_maker/widget/button/custom_elevated_button.dart';
import 'package:resume_maker/widget/dialog/loading.dart';

class Trending extends StatelessWidget {
  const Trending({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: AppStyle.boxDecoration,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              StrRes.treding.toText(
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                ),
              ),
              StrRes.more
                  .toText(
                    style:
                        TextStyle(fontSize: 16, color: AppColors.tertiaryColor),
                  )
                  .append('>>'),
            ],
          ),
          10.verticalGap,
          SizedBox(
            height: 185, // Dynamically calculated height
            child: ListView.separated(
              physics: const NeverScrollableScrollPhysics(),
              cacheExtent: 130,
              scrollDirection: Axis.horizontal,
              shrinkWrap: true,
              itemCount: 10,
              itemBuilder: (context, i) {
                return Column(
                  children: [
                    Container(
                      alignment: Alignment.center,
                      height: 130, // Adjust height dynamically
                      width: 100, // Fixed width (change if needed)
                      decoration: BoxDecoration(
                          color: AppColors.scaffoldBackgroundColor,
                          borderRadius: BorderRadius.circular(10),
                          image: const DecorationImage(
                            image: AssetImage(ImgRes.cv0),
                            fit: BoxFit.cover,
                          )),
                      //child: '100 x 130'.toText(),
                    ),
                    5.verticalSpace,
                    CustomElevatedButton(
                      title: StrRes.tryNow,
                      onPressed: () async {
                        LoadingDialog.show();
                        Future.delayed(const Duration(seconds: 5), () {
                          LoadingDialog.hide();
                        }).then((value) {
                          Get.toNamed(
                            "/templete",
                          );
                        });
                      },
                    ),
                  ],
                );
              },
              separatorBuilder: (context, i) {
                return 10.horizontalSpace;
              },
            ),
          )
        ],
      ),
    );
  }
}
