import 'package:book_store/app_export.dart';
import 'package:book_store/view/homepage_module/homepage_view.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../utils/global.dart';

class SignInController extends GetxController{

  //TextEditingController email = TextEditingController(), password = TextEditingController();

  bool onPasswordShow = false;

  onPasswordShowFunc(){
    onPasswordShow = !onPasswordShow;
    update();
  }

  checkValidation(){
    if(Global.email.text.trim().isEmpty)
    {
      Utils.showToast("Please Enter Email");
    }
    else  if(Global.password.text.trim().isEmpty)
    {
      Utils.showToast("Please Enter password");
    }
    else if(Utils.validateEmail(Global.email.text.trim()) != null )
    {
      Utils.showToast("Please Enter Valid Email");
    }
    else if(Global.password.text.trim().length < 8)
    {
      Utils.showToast("Please Enter Valid password");
    }
    else{
      performLogin();
    }
  }

  performLogin()async{
    try {
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: Global.email.text.trim(),
        password: Global.password.text.trim(),
      );

      final user = credential.user;
      if (user != null) {
        debugPrint("============= $user =============================");
        Utils.showToast("Login Successfully");
        Injector.setAuthenticationKeys(user.uid);
        Get.offAll(const HomePageView());
        //Get.offAll(BottomNavigationBarCustom(),transition: Transition.cupertino);
        //Global.email.clear();
        //Global.password.clear();
      } else {
        Utils.showToast("Wrong password provided for that user.");
      }

    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        Utils.showToast("No user found for that email");
      } else if (e.code == 'wrong-password') {
        Utils.showToast("Wrong password provided for that user.");
      }
      else if (e.code == 'INVALID_LOGIN_CREDENTIALS') {
        Utils.showToast('Please check your email and password.');
      }
    }


  }


}