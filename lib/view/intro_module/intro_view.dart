import '../../app_export.dart';

class IntroView extends StatelessWidget {
  const IntroView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: IntroController(),
      builder: (_){
        return Scaffold(
          body: mainBody(_ , context),
        );
      },
    );
  }

  mainBody(IntroController _ , BuildContext context){
    double height = MediaQuery.of(context).size.height,
        width = MediaQuery.of(context).size.width;
    return Stack(
      children: [
        Image.asset(Utils.getAssetsJpgImg(Images.intro),
          fit: BoxFit.cover,
          height: height,
          width: width,
        ),
        Container(
          color: BookStoreColor.primaryColor.withOpacity(0.25),
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            getBodyText(),
            performNavigateButton(_),
          ],
        )
      ],
    );
  }


  performNavigateButton(IntroController _){
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.only(bottom: 10),
        child: Container(
          padding: const EdgeInsets.all(2),
          margin: const EdgeInsets.all(15),
          decoration: BoxDecoration(
              color: BookStoreColor.white,
              borderRadius: BorderRadius.circular(10)
          ),
          child: IconButton(
            icon: Icon(Icons.arrow_forward_rounded,color: BookStoreColor.primaryColor,),
            onPressed: (){
              _.performNavigationButton();
            },
          ),
        ),
      ),
    );
  }

  getBodyText(){
    return Expanded(
      flex: 4,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20 , vertical: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            BaseText(text: "Welcome To", color: BookStoreColor.white,fontSize: 40,fontWeight: FontWeight.w800,),
            BaseText(text: "Book Store,", color: BookStoreColor.white,fontSize: 30),

            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: BaseText(text: "You never feel alone come\nhere..", color: BookStoreColor.white,fontSize: 18,),
            ),
          ],
        ),
      ),
    );
  }

}
