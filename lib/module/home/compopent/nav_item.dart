import 'package:flutter/material.dart';
import 'package:resume_maker/style/color.dart';
import 'package:resume_maker/widget/images/svg_asset.dart';

class NavItem {
  static BottomNavigationBarItem buildNavItem({
    required String iconPath,
    required String label,
    required Color color,
    required int itemIdx,
    required int currentIdx,
  }) {
    return BottomNavigationBarItem(
      icon: SvgAsset(
        assetName: iconPath,
        height: 30,
        widget: 30,
        color: itemIdx == currentIdx
            ? AppColors.iconColor
            : AppColors.txtColor.withAlpha(100),
      ),
      label: label,
    );
  }
}
