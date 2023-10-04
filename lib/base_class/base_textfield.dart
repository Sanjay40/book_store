import 'package:book_store/app_export.dart';
import 'package:book_store/base_class/base_textStyle.dart';
import 'package:book_store/view/homepage_module/homepage_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';

import '../utils/decoration.dart';

class BaseTextField{


  static CupertinoTextField textField({
    required TextEditingController controller,
    TextInputType? textInputType,
    List<TextInputFormatter>? textInputFormatter,
    required String placeholder,
    dynamic prefix,
    Widget? suffix,
    bool? obscureText,
  }) {
    return CupertinoTextField(
      controller: controller,
      keyboardType: textInputType,
      inputFormatters: textInputFormatter,
      placeholder: placeholder,
      placeholderStyle: TextStyle(color: BookStoreColor.primaryColor , fontWeight: FontWeight.w500),
      padding: const EdgeInsets.symmetric(vertical: 16),
      prefix: Padding(padding: EdgeInsets.symmetric(horizontal: 8),),
      //prefix: Padding(padding: const EdgeInsets.symmetric(horizontal: 0), child: Icon(prefix)),
      suffix: suffix,
      obscureText: obscureText ?? false,
      cursorColor: BookStoreColor.primaryColor,
      suffixMode: OverlayVisibilityMode.editing,
      decoration: CustomDecoration.outlineDecoration(border: Border.all(color: BookStoreColor.black, width: 0.8), borderRadius: BorderRadius.circular(10)),
      style: TextStyle(
        fontWeight: FontWeight.w700,
        color: BookStoreColor.primaryColor,
        fontSize: 18,
      ),
    );
  }

  static CupertinoSearchTextField searchField({required HomePageController controller}) {
    return CupertinoSearchTextField(
      controller: controller.search,
      onChanged: controller.onSearchVal,
      placeholderStyle: CustomFontStyle.style14GreyW400,
      itemColor: BookStoreColor.darkBlue,
      padding: EdgeInsets.symmetric(vertical: 10),
    );
  }

}