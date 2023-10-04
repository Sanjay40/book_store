import '../app_export.dart';

class CustomDecoration{
  static BoxDecoration outlineDecoration({BoxBorder? border, BorderRadius? borderRadius}) {
    return BoxDecoration(border: border, borderRadius: borderRadius);
  }

  static Decoration splashBottomContainer() {
    return BoxDecoration(
      color: Colors.white,
      borderRadius: const BorderRadius.vertical(top: Radius.circular(30)),
      boxShadow: [BoxShadow(blurRadius: 4, color: BookStoreColor.grey)],
    );
  }

  static Decoration colorRadius({Color? color, double? radius, Border? border}) {
    return BoxDecoration(
      color: color, border: border,
      borderRadius: BorderRadius.circular(radius!),
    );
  }

}