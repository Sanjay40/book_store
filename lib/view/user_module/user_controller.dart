import 'package:book_store/app_export.dart';
import 'package:firebase_auth/firebase_auth.dart';

class UserController extends GetxController{
  void logOutButton(){
    Injector.prefs!.remove(PrefsKey.authenticationKeys);
    Get.offAll(IntroView());
    update();
  }



}