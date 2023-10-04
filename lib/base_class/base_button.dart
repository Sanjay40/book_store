import 'dart:ui';

import '../app_export.dart';
import '../utils/decoration.dart';
import 'base_textStyle.dart';

class CustomButton {
  static GestureDetector customButton({required dynamic onTap, double? width,  double? height ,  required String title, Color? backgroundColor}) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: height,
        width: width,
        decoration: CustomDecoration.colorRadius(color: backgroundColor ?? BookStoreColor.darkBlue, radius: 10),
        alignment: Alignment.center,
        child: Text(title, style: title == BookStoreString.cancel ? CustomFontStyle.style14BlackW600 : CustomFontStyle.style14whiteW600),
      ),
    );
  }
}