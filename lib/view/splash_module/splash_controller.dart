

import '../../app_export.dart';



class SplashController extends GetxController{

  @override
  void onInit() {
    super.onInit();
    Timer(const Duration(seconds: 4), () {
      Get.offAll(const IntroView());
      // if(Injector.getIntroKeys() == true){
      //
      // }
    });
  }
}