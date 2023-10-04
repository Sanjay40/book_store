import 'package:book_store/app_export.dart';
import 'package:firebase_auth/firebase_auth.dart';

class HomePageController extends GetxController{

  int pageIndex = 0;

  TextEditingController search = TextEditingController();
  ValueNotifier searchProduct = ValueNotifier<String>('');

  onSearchVal(val) {
    searchProduct.value = val;
    update();
  }

  final user = FirebaseAuth.instance.currentUser;

  //static var getData = [];

  onBottomTap(val) {
    //search.clear();
    //searchProduct.value.value = '';
    pageIndex = val;
    print("page index $pageIndex");
    //if(pageIndex == 1) {
      //FirebaseFetchData.fetchFavouriteProductData().whenComplete(() => dataFetched.value = true);
    //} else if(pageIndex == 2) {
      //Loader.loader();
      // FirebaseFetchData.fetchCartProductData().whenComplete(() {
      //   Get.back();
      //   dataFetched.value = true;
      //   Get.forceAppUpdate();
      // });
    //}
    update();
  }

}