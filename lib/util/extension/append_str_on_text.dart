import 'package:flutter/material.dart';

extension TextExtensions on Text {
  Text append(String suffix) {
    return Text(
      "${data ?? ''} $suffix",
      style: style, // Retain original style
      textAlign: textAlign, // Retain alignment
      maxLines: maxLines, // Retain max lines
      overflow: overflow, // Retain overflow handling
    );
  }
}
