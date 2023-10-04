import 'package:book_store/view/homepage_module/homepage_view.dart';

import '../../app_export.dart';

class IntroController extends GetxController{

  performNavigationButton(){
    if(Injector.getAuthenticationKeys() != null){
      Get.offAll(HomePageView());
    }else{
      Get.offAll(SignInView());
    }
   // update();
  }

}