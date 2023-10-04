
import 'package:book_store/base_class/base_sizedbox.dart';
import 'package:book_store/base_class/base_textfield.dart';
import 'package:book_store/view/homepage_module/homepage_controller.dart';

import '../app_export.dart';

class SearchProductBar {
  static Widget searchBar({required HomePageController controller}) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(15, 15, 15, 5),
      child: Row(
        children: [
          //Image.asset(Utils.getAssetsPngImg(Images.appLogo), height: 35, color: BookStoreColor.primaryColor,),
          //CustomSizedBox.sizedBox(width: 10),
          Expanded(
            child: BaseTextField.searchField(controller: controller),
          ),
          CustomSizedBox.sizedBox(width: 18),
          Icon(IconPath.outLineCart),
          CustomSizedBox.sizedBox(width: 18),
          Icon(IconPath.notifications)
        ],
      ),
    );
  }
}