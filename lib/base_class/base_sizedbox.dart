import '../app_export.dart';

class CustomSizedBox {

  static Widget sizedBox({double? height, double? width}) {
    return SizedBox(height: height, width: width);
  }

  static Widget spacer({int? flex}) {
    return Spacer(flex: flex!);
  }
}