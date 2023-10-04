import 'package:book_store/app_export.dart';

class SplashView extends StatelessWidget {
  const SplashView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return GetBuilder(
      init: SplashController(),
        builder: (_){
          return Scaffold(
            body: mainBody(_ , context),
          );
        },
    );
  }

  mainBody(SplashController _ , BuildContext context){
    double height = MediaQuery.of(context).size.height,
        width = MediaQuery.of(context).size.width;
    return SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Spacer(),
              Center(child: Lottie.asset(LottiePath.bookLogo,fit: BoxFit.cover,height: height / 4)),
              const Spacer(),
              Align(
                alignment: Alignment.bottomCenter,
                child: DelayedDisplay(
                  delay: const Duration(seconds: 2),
                  child: Padding(
                    padding: const EdgeInsets.only(top: 10, bottom: 20),
                    child: BaseText(text: "Book Store",fontWeight: FontWeight.w900,color: BookStoreColor.primaryColor,fontSize: 40),
                  ),
                ),
              ),
            ],
          ),
        ),
    );
  }

}
