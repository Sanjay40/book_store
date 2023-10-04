

import 'package:flutter/cupertino.dart';
import '../../app_export.dart';
import '../../base_class/base_raisedButton.dart';
import '../../base_class/base_textfield.dart';
import '../sign_up_module/sign_up_view.dart';

class SignInView extends StatelessWidget {
  SignInView({Key? key}) : super(key: key);

  @override
  Widget build(context) {
    return GetBuilder(
        init: SignInController(),
        dispose: (_) => Get.delete<SignInController>(),
        builder: (_) {
          return GestureDetector(
            onTap: (){
              FocusManager.instance.primaryFocus?.unfocus();
            },
            child: Scaffold(
              resizeToAvoidBottomInset: false,
              body: mainBody(_ , context),
            )
          );
        });
  }

  mainBody(SignInController _ , BuildContext context) {
        double height = MediaQuery.of(context).size.height,
        width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15 , vertical: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              //crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Center(
                  child: Image.asset(Utils.getAssetsPngImg(Images.appLogo),
                    color: BookStoreColor.primaryColor,
                    width: width / 6,
                  ),
                ),
                const SizedBox(height: 40,),
                Center(
                  child: BaseText(text: "Login To Your Account",
                    color: BookStoreColor.primaryColor,
                    fontWeight: FontWeight.w900,
                    letterSpacing: 0.8,
                    fontSize: 25,
                  ),
                ),
                const SizedBox(height: 80,),
               // const Spacer(flex: 1,),
                BaseText(text: "Email",
                  color: BookStoreColor.primaryColor,
                  fontWeight: FontWeight.w600,
                  letterSpacing: 0.8,
                  fontSize: 20,
                ),
                const SizedBox(height: 10,),
                BaseTextField.textField(
                  controller: _.email,
                  textInputType: TextInputType.emailAddress,
                  placeholder: BookStoreString.emailHint,
                  //prefix: IconPath.user,
                ),
                const SizedBox(height: 20,),
                BaseText(text: "Password",
                  color: BookStoreColor.primaryColor,
                  fontWeight: FontWeight.w600,
                  letterSpacing: 0.8,
                  fontSize: 20,
                ),
                const SizedBox(height: 10,),
                BaseTextField.textField(
                  controller: _.password,
                  placeholder: BookStoreString.passwordHint,
                  obscureText: (_.onPasswordShow) ? true : false,
                  suffix: IconButton(onPressed: (){
                    _.onPasswordShowFunc();
                  }, icon: Icon((_.onPasswordShow) ? CupertinoIcons.eye_slash : CupertinoIcons.eye, color: BookStoreColor.primaryColor,))
                  //prefix: IconPath.user,
                ),
                const SizedBox(height: 80,),
                SizedBox(
                  width: width,
                  child: BaseRaisedButton(
                    borderRadius: 16,
                    buttonText: "Login",
                    onPressed: () {
                      _.checkValidation();
                    },

                  ),
                ),
                const Spacer(),
                getSignUp(),
              ],
            ),
          ),
        //),
       );
     }
    //);
  }


  getSignUp() {
    return Center(
      child: Wrap(
        //alignment: WrapAlignment.center,
        children: [
          BaseText(
            text: "Don’t have an account?",
            fontSize: 18,
            fontWeight: FontWeight.w600,
            color: BookStoreColor.black,
          ),
          GestureDetector(
              onTap: () {
                Get.to(() => SignUpView(),transition: Transition.cupertino);
              },
              child: BaseText(
                  text: " Sign up here!",
                  fontSize: 18,
                  fontWeight: FontWeight.w800,
                  textDecoration: TextDecoration.underline,
                  color: BookStoreColor.primaryColor))
        ],
      ),
    );
 }






// class SignInView extends StatelessWidget {
//   const SignInView({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return GetBuilder(
//       init: SignInController(),
//       builder: (_){
//         return Scaffold(
//           body: mainBody(_ , context),
//         );
//       },
//     );
//   }
//
//   mainBody(SignInController _, BuildContext context){
//     double height = MediaQuery.of(context).size.height,
//         width = MediaQuery.of(context).size.width;
//     return SafeArea(
//         child: Center(
//           child: Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 15 , vertical: 20),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.center,
//               children: [
//                 Image.asset(Utils.getAssetsPngImg(Images.appLogo),
//                   color: BookStoreColor.primaryColor,
//                   width: width / 6,
//                 ),
//                 BaseText(text: "Login To Your Account",
//                   color: BookStoreColor.primaryColor,
//                   fontWeight: FontWeight.w900,
//                   letterSpacing: 0.8,
//                   fontSize: 25,
//                 ),
//                 BaseText(text: "Email",
//                   color: BookStoreColor.primaryColor,
//                   fontWeight: FontWeight.w600,
//                   letterSpacing: 0.8,
//                   fontSize: 20,
//                 ),
//                 BaseTextField.textField(
//                   controller: _.email,
//                   textInputType: TextInputType.emailAddress,
//                   placeholder: BookStoreString.emailHint,
//                   //prefix: IconPath.user,
//                 ),
//                 BaseText(text: "Password",
//                   color: BookStoreColor.primaryColor,
//                   fontWeight: FontWeight.w600,
//                   letterSpacing: 0.8,
//                   fontSize: 20,
//                 ),
//                 BaseTextField.textField(
//                   controller: _.password,
//                   placeholder: BookStoreString.passwordHint,
//                   obscureText: (_.onPasswordShow) ? true : false,
//                   suffix: IconButton(onPressed: (){
//                     _.onPasswordShowFunc();
//                   }, icon: Icon((_.onPasswordShow) ? CupertinoIcons.eye_slash : CupertinoIcons.eye, color: BookStoreColor.primaryColor,))
//                   //prefix: IconPath.user,
//                 ),
//
//               ],
//             ),
//           ),
//         ),
//     );
//   }
//
// }
