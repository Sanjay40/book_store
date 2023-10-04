import 'dart:ui';
import 'package:book_store/base_class/base_textStyle.dart';
import '../app_export.dart';
import '../utils/decoration.dart';
import 'base_button.dart';
import 'base_sizedbox.dart';

class CustomDialog {

  static customDialog({required void Function() onTap, required String title, required String actionTitle}) {
    return Get.dialog(
      barrierColor: BookStoreColor.transparent,
     // barrierDismissible: false,
      BackdropFilter(
        filter: ImageFilter.blur(
          sigmaX: 7,
          sigmaY: 7,
        ),
        child: Material(
          elevation: 5,
          color: BookStoreColor.transparent,
          child: WillPopScope(
            onWillPop: () async => false,
            child: Center(
              child: Container(
                width: 300,
                padding: const EdgeInsets.all(10),
                margin: const EdgeInsets.symmetric(horizontal: 15),
                decoration: CustomDecoration.colorRadius(color: BookStoreColor.white, radius: 15),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Flexible(child: AutoSizeText(BookStoreString.logOut, maxLines: 1 ,style: CustomFontStyle.style16PrmW900,)),
                    CustomSizedBox.sizedBox(height: 10),
                    Flexible(child: AutoSizeText(title, maxLines: 1 ,style: CustomFontStyle.style16PrmW500,)),
                    CustomSizedBox.sizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                            CustomButton.customButton(
                              onTap: () => Get.back(),
                              title: BookStoreString.cancel,
                              backgroundColor: BookStoreColor.white,
                            ),
                        CustomSizedBox.sizedBox(width: 15),
                        CustomButton.customButton(
                          onTap:onTap,
                          title: BookStoreString.logOut,
                          width: 100,
                          height: 40,
                          backgroundColor: BookStoreColor.black,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}