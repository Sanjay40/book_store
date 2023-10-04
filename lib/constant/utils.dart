import 'package:book_store/app_export.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Utils{
  static getAssetsPngImg(String name) {
    return "assets/image/" + name + ".png";
  }

  static getAssetsJpgImg(String name) {
    return "assets/image/" + name + ".jpg";
  }

  static getAssetsSVGImg(String name) {
    return "assets/image/" + name + ".svg";
  }

  static String? validateEmail(String value) {
    //Alphanumeric characters
    String pattern = r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+";
    RegExp regExp = RegExp(pattern);
    return regExp.hasMatch(value) ? null : "Enter valid email.";
    // return regExp.hasMatch(value);
  }

  static showToast(String? message) {
    if (message != null && message != "") {
      Fluttertoast.showToast(
          msg: message, toastLength: Toast.LENGTH_SHORT, timeInSecForIosWeb: 3, gravity: ToastGravity.BOTTOM, backgroundColor: BookStoreColor.black, textColor: Colors.white);
    }
  }

}