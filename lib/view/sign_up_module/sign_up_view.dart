import 'package:book_store/view/sign_up_module/sign_up_controller.dart';
import 'package:flutter/cupertino.dart';

import '../../app_export.dart';
import '../../base_class/base_raisedButton.dart';
import '../../base_class/base_textfield.dart';

class SignUpView extends StatelessWidget {
  const SignUpView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: SignUpController(),
      dispose: (_) => Get.delete<SignUpController>(),
        builder: (_){
          return GestureDetector(
            onTap: (){
              FocusManager.instance.primaryFocus?.unfocus();
            },
            child: Scaffold(
              resizeToAvoidBottomInset: false,
              body: mainBody(_ , context),
            ),
          );
        },
    );
  }

  mainBody(SignUpController _ , BuildContext context){
    double height = MediaQuery.of(context).size.height,
        width = MediaQuery.of(context).size.width;
    return SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15 , vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Image.asset(Utils.getAssetsPngImg(Images.appLogo),
                  color: BookStoreColor.primaryColor,
                  width: width / 6,
                ),
              ),
              const SizedBox(height: 40,),
              Center(
                child: BaseText(text: "Create Your Account",
                  color: BookStoreColor.primaryColor,
                  fontWeight: FontWeight.w900,
                  letterSpacing: 0.8,
                  fontSize: 25,
                ),
              ),
              const SizedBox(height: 50,),
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
              const SizedBox(height: 20,),
              BaseText(text: "Password",
                color: BookStoreColor.primaryColor,
                fontWeight: FontWeight.w600,
                letterSpacing: 0.8,
                fontSize: 20,
              ),
              const SizedBox(height: 10,),
              BaseTextField.textField(
                  controller: _.confirmPassword,
                  placeholder: BookStoreString.confirmPassword,
                  obscureText: (_.onConfirmPasswordShow) ? true : false,
                  suffix: IconButton(onPressed: (){
                    _.onConfirmPasswordShowFunc();
                  }, icon: Icon((_.onConfirmPasswordShow) ? CupertinoIcons.eye_slash : CupertinoIcons.eye, color: BookStoreColor.primaryColor,))
                //prefix: IconPath.user,
              ),
              const SizedBox(height: 80,),
              SizedBox(
                width: width,
                child: BaseRaisedButton(
                  borderRadius: 16,
                  buttonText: "Sign up",
                  onPressed: () {
                    _.checkValidation();
                  },

                ),
              ),
              const Spacer(),
              getSignIn(),
            ],
          ),
        ),
    );
  }

  getSignIn() {
    return Center(
      child: Wrap(
        //alignment: WrapAlignment.center,
        children: [
          BaseText(
            text: "Already Have An Account?",
            fontSize: 18,
            fontWeight: FontWeight.w600,
            color: BookStoreColor.black,
          ),
          GestureDetector(
              onTap: () {
                Get.back();
                //Get.to(() => SignUpView(),transition: Transition.cupertino);
              },
              child: BaseText(
                  text: " Sign In here!",
                  fontSize: 18,
                  fontWeight: FontWeight.w800,
                  textDecoration: TextDecoration.underline,
                  color: BookStoreColor.primaryColor))
        ],
      ),
    );
  }


}
