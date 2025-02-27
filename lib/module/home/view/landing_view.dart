import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:resume_maker/controller/home/controller/landing_controller.dart';
import 'package:resume_maker/module/home/compopent/nav_item.dart';
import 'package:resume_maker/res/img_res.dart';
import 'package:resume_maker/res/str_res.dart';
import 'package:resume_maker/route/app_rout.dart';
import 'package:resume_maker/style/color.dart';

class LandingView extends StatelessWidget {
  const LandingView({super.key, required this.title});
  final String title;
  static final landingController = Get.find<LandingController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        actions: const [],
      ),
      body: GetRouterOutlet(
        anchorRoute: AppRoute.home,
        initialRoute: AppRoute.home,
      ),
      bottomNavigationBar: Obx(
        () => BottomNavigationBar(
          currentIndex: landingController.currentIndex,
          onTap: landingController.changeIndex,
          type: BottomNavigationBarType.fixed,
          selectedItemColor: AppColors.iconColor,
          //unselectedItemColor: AppColors.iconColor,
          items: <BottomNavigationBarItem>[
            NavItem.buildNavItem(
              iconPath: ImgRes.icHome,
              label: StrRes.home,
              color: AppColors.iconColor,
              itemIdx: 0,
              currentIdx: landingController.currentIndex,
            ),
            NavItem.buildNavItem(
              iconPath: ImgRes.icFolder,
              label: StrRes.templete,
              color: AppColors.iconColor,
              itemIdx: 1,
              currentIdx: landingController.currentIndex,
            ),
            NavItem.buildNavItem(
              iconPath: ImgRes.icProfile,
              label: StrRes.profile,
              color: AppColors.iconColor,
              itemIdx: 2,
              currentIdx: landingController.currentIndex,
            ),
          ],
        ),
      ),
    );
  }
}
