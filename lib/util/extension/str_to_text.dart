import 'package:flutter/material.dart';
import 'package:resume_maker/style/style.dart';

extension StringTextExtension on String {
  Text toText(
      {TextStyle? style, int? maxLines, TextAlign? textAlign, bool? softWrap}) {
    return Text(
      maxLines: maxLines,
      softWrap: softWrap,
      overflow: TextOverflow.ellipsis,
      textAlign: textAlign,
      this, // The String will be used as the text content
      style: style ??
          AppStyle
              .txtNormal, // Default to predefined style if no style is passed
    );
  }
}
