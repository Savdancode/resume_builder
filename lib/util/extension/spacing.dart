import 'package:flutter/widgets.dart';

extension CustomSpacing on num {
  // Rename methods to avoid conflicts
  Widget get verticalGap => SizedBox(height: toDouble());
  Widget get horizontalGap => SizedBox(width: toDouble());
}
