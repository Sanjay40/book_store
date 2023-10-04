import 'package:book_store/app_export.dart';
import 'package:book_store/base_class/base_button.dart';
import 'package:book_store/helper/firebase_helper.dart';
import 'package:book_store/view/details_module/details_controller.dart';

import '../../base_class/base_textStyle.dart';

class DetailsView extends StatelessWidget {
  const DetailsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: DetailsController(),
        builder: (_){
          return Scaffold(
            appBar: AppBar(
              backgroundColor: BookStoreColor.white.withOpacity(0.2),
              elevation: 0,
              leading: IconButton(
                icon: Icon(IconPath.back,color: BookStoreColor.black,),
                onPressed: (){Get.back();},
              ),
            ),
            body: mainBody(_ , context),
            bottomNavigationBar: getBottomNavigationBar(_),
          );
        },
    );
  }

  mainBody(DetailsController _ , context){
    double height = MediaQuery.of(context).size.height, width = MediaQuery.of(context).size.width;
    return SafeArea(
        child: StreamBuilder(
          stream:  FirebaseFirestore.instance.collection('books').snapshots(),
          builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
            if (snapshot.hasError) {
              print("${snapshot.error}");
              return Utils.showToast("Something went wrong");
            }

            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator(),);
            }

            if (!snapshot.hasData || snapshot.data == null) {
              return BaseText(text:  "No data Found");
            }
            var data = snapshot.data.docs[Get.arguments];
            return ListView(
              physics: BouncingScrollPhysics(),
              padding: EdgeInsets.symmetric(horizontal: 25),
              children: [
                ClipRRect(
                  child: Image.network(data['image'],
                    height: height / 3.8,
                    //fit: BoxFit.fill,
                  ),
                ),
                Align(
                  alignment: Alignment.topCenter,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 15),
                    child: Row(
                      children: [
                        Align(
                          alignment: Alignment.topLeft,
                          child: Text("${data['name']}",
                            style: CustomFontStyle.style20PrmW900,

                          ),
                        ),
                        Spacer(),
                        GestureDetector(
                            onTap: (){
                              print("====== data ${Get.arguments}");
                             FirebaseHelper.updateData(index: snapshot.data!.docs[Get.arguments].id, changeFavData: data['like']);
                            },
                            child: (data['like']) ? Icon(Icons.favorite,color: BookStoreColor.primaryColor,) :Icon(Icons.favorite_outline,color: BookStoreColor.primaryColor,)),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Text("⭐ 4.5" , style: CustomFontStyle.style14PrmW600,),
                ),
                Text("\$${data['price']}",
                  style: CustomFontStyle.style14PrmW600,
                ),

                Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: Text("Summary",
                    style: CustomFontStyle.style20PrmW900,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Text("Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the "
                      "industry's standard dummy text ever since the "
                      "1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.",
                    style: CustomFontStyle.style14PrmW600,
                  ),
                ),

              ],
            );
          },

        ),
    );
  }

  getBottomNavigationBar(DetailsController _){
    return Container(
      height: 70,
      color: BookStoreColor.white,
      child: Row(
        children: [
          Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Row(
                  children: [
                    incrementDecrementContainer(onPressed: (){_.decrementFunc();} , icon: Icons.remove),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal:15),
                      child: Text("${_.performValueGet}",
                        // fontSize: Utils.getSize(30),
                       style: CustomFontStyle.style20PrmW900,
                      ),
                    ),
                    incrementDecrementContainer(onPressed: (){_.incrementFunc();} , icon: Icons.add),
                  ],
                ),
              )

            ),
          Expanded(
              flex: 2,
              child: StreamBuilder(
                stream: FirebaseFirestore.instance.collection('books').snapshots(),
                builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
                  if (snapshot.hasError) {
                    print("${snapshot.error}");
                    return Utils.showToast("Something went wrong");
                  }

                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator(),);
                  }

                  if (!snapshot.hasData || snapshot.data == null) {
                    return BaseText(text:  "No data Found");
                  }
                  var data = snapshot.data.docs[Get.arguments];
                  return  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: CustomButton.customButton(
                        onTap: (){
                          FirebaseHelper.updateCartData(index: snapshot.data!.docs[Get.arguments].id, changeCartData: data['cart']);
                        }, title: 'Buy Now',height: 50),
                  );
                },

              ))
        ],
      ),
    );
  }

  incrementDecrementContainer({required IconData? icon , required void Function()? onPressed}){
    return Container(
        padding: EdgeInsets.all(1),
        //margin: EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: BookStoreColor.primaryColor,
          borderRadius: BorderRadius.circular(5),
        ),
        child:  GestureDetector(
            onTap: onPressed,
            child: Icon(icon , color: BookStoreColor.white,))
    );
  }

}
