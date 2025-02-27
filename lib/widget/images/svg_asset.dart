import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SvgAsset extends StatelessWidget {
  final String assetName;
  final Color? color;
  final double? height, widget;
  const SvgAsset(
      {super.key,
      required this.assetName,
      this.color,
      this.height,
      this.widget});

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      height: height,
      width: widget,
      assetName,
      colorFilter:
          color == null ? null : ColorFilter.mode(color!, BlendMode.srcIn),
    );
  }
}
