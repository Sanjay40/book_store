import 'package:book_store/base_class/base_sizedbox.dart';
import 'package:book_store/base_class/base_textStyle.dart';
import 'package:book_store/view/favourite_module/favourite_controller.dart';

import '../../app_export.dart';
import '../../utils/decoration.dart';

class FavouriteView extends StatelessWidget {
  const FavouriteView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: FavouriteController(),
        builder: (_){
          return Scaffold(
            body: mainBody(),
          );
        });
  }

  mainBody(){
    return SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20,vertical: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(BookStoreString.favourite,style: CustomFontStyle.style20PrmW900,),
              Expanded(
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

                      return ListView.builder(
                        physics: const BouncingScrollPhysics(),
                        itemCount: snapshot.data.docs.length,
                        itemBuilder: (context,index){
                          var data =  snapshot.data.docs[index];
                          return (data['like']) ? Container(
                            // padding: const EdgeInsets.symmetric(vertical: 20 ),
                            margin: EdgeInsets.symmetric(vertical: 10),
                            decoration: CustomDecoration.colorRadius(
                                radius: 10,
                                color: BookStoreColor.transparent,
                                border: Border.all(
                                  color: BookStoreColor.primaryColor,
                                )
                            ),
                            child: Row(
                              children: [
                                Container(
                                  margin: EdgeInsets.symmetric(horizontal: 15 , vertical: 15),
                                  //padding: EdgeInsets.symmetric(horizontal: 40 , vertical: 50),
                                  decoration: CustomDecoration.colorRadius(
                                    radius: 10,
                                    color: BookStoreColor.primaryColor,
                                  ),
                                  child: Image.network(data['image'],
                                    height: 60,width: 45,
                                    fit: BoxFit.fill,
                                  ),
                                  //child: Image.asset(Utils.getAssetsJpgImg(Images.books1) , height: 60,width: 45,fit: BoxFit.fill,),
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  //direction: Axis.vertical,
                                  children: [
                                    Text("${data['name']}",style: CustomFontStyle.style16PrmW900,),
                                    CustomSizedBox.sizedBox(height: 12),
                                    Text("\$${data['price']}",style: CustomFontStyle.style14PrmW600,),
                                  ],
                                ),
                              ],
                            ),
                          ) : Container();
                        },
                      );
                    },)
              ),
            ],
          ),
        ),
    );
  }

}
