import 'package:book_store/app_export.dart';
import 'package:book_store/view/homepage_module/homepage_view.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SignUpController extends GetxController{

  TextEditingController email = TextEditingController(), password = TextEditingController() , confirmPassword = TextEditingController();

  bool onPasswordShow = false;

  bool onConfirmPasswordShow = false;

  onPasswordShowFunc(){
    onPasswordShow = !onPasswordShow;
    update();
  }

  onConfirmPasswordShowFunc(){
    onConfirmPasswordShow = !onConfirmPasswordShow;
    update();
  }

  checkValidation(){
    if(email.text.trim().isEmpty)
    {
      Utils.showToast("Please Enter Email");
    }
    else  if(password.text.trim().isEmpty)
    {
      Utils.showToast("Please Enter password");
    }
    else if(confirmPassword.text.trim().isEmpty)
    {
      Utils.showToast("Please Enter confirm password");
    }
    else if(Utils.validateEmail(email.text.trim()) != null )
    {
      Utils.showToast("Please Enter Valid Email");
    }
    else if(password.text.trim().length < 8)
    {
      Utils.showToast("Please Enter Valid password");
    }
    else if(confirmPassword.text.trim().length < 8)
    {
      Utils.showToast("Please Enter Valid confirm password");
    }
    else if(password.text.trim() != confirmPassword.text.trim())
    {
      Utils.showToast("The password and confirm password does not match");
    }
    else{
      performRegister();
    }
  }

  void performRegister()async{
    try {
      final credential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email.text.trim(),
        password: password.text.trim(),
      );

      final user = credential.user;
      if (user != null) {
        debugPrint("============= $user =============================");
        //await user?.updateDisplayName(userNameController.text.trim());
        Utils.showToast('User successfully created.');
        Injector.setAuthenticationKeys(user.uid);
        //addUser(user.uid);
        Get.offAll(HomePageView());
        //Get.offAll(BottomNavigationBarCustom(),transition: Transition.cupertino);
      } else {
        Utils.showToast('User is null. Something went wrong.');
      }

    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        Utils.showToast('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        Utils.showToast('The account already exists for that email.');
      } else {
        print('An error occurred: ${e.code}');
      }
    } catch (e) {
      print('An error occurred: $e');
    }

  }


  // Future<void> addUser(String uid) {
  //   return FirebaseFirestore.instance.collection(uid)
  //       .add({
  //     'userId': userNameController.text.trim(),
  //     'email' : email.text.trim(),
  //     'password' : password.text.trim(),
  //     'myCart' : [],
  //     'myFav' : [],
  //     'profileImage' : '',
  //   })
  //       .then((value) => print("User Added"),)
  //       .catchError((error) => print("Failed to add user: $error"));
  // }

}