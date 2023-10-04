import 'package:book_store/base_class/base_bookStoreContainer.dart';
import 'package:book_store/base_class/base_searchbar.dart';
import 'package:book_store/base_class/base_textStyle.dart';
import 'package:book_store/view/admin/admin_add_module/admin_view.dart';
import 'package:book_store/view/cart_module/cart_view.dart';
import 'package:book_store/view/details_module/details_view.dart';
import 'package:book_store/view/favourite_module/favourite_view.dart';
import 'package:book_store/view/homepage_module/homepage_controller.dart';
import 'package:book_store/view/user_module/user_view.dart';
import '../../app_export.dart';
import '../../base_class/base_bottom_navigation_bar.dart';
import '../../base_class/base_sizedbox.dart';

class HomePageView extends StatelessWidget {
  const HomePageView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: HomePageController(),
      builder: (_) {
        return GestureDetector(
          onTap: () {
            FocusManager.instance.primaryFocus!.unfocus();
          },
          child: Scaffold(
            body: mainBody(_, context),
            bottomNavigationBar: BottomBar.bottomNavigationBar(index: _.pageIndex, onBottomTap: _.onBottomTap),
            floatingActionButton: (_.user!.uid == "J0KRcOT1oIOaiugO3uzEHhvUSKz2") ? FloatingActionButton(
              onPressed: (){Get.to(AdminView(opertionName: BookStoreString.addValue,getIndex: 0,)  );} ,
              backgroundColor: BookStoreColor.primaryColor,
              child: Icon(Icons.add,color: BookStoreColor.white,),
            ) : Container(),
          ),
        );
      },
    );
  }

  mainBody(HomePageController _, BuildContext context) {
    return SafeArea(
        child: IndexedStack(index: _.pageIndex, children: [
      performHomePageView(_, context),
      const FavouriteView(),
      const CartView(),
      UserView(),
    ]));
  }

  performHomePageView(HomePageController _, BuildContext context) {
    double height = MediaQuery.of(context).size.height, width = MediaQuery.of(context).size.width;
    return Column(
      children: [
        SearchProductBar.searchBar(controller: _),
        Expanded(
          child: ListView(
            padding: EdgeInsets.symmetric(vertical: 15 , horizontal: 15),
            physics: BouncingScrollPhysics(),
            children: [
              Text(BookStoreString.wishListedBooks, style: CustomFontStyle.style20PrmW600),
              SizedBox(
                height: height - 200,
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: StreamBuilder(
                    stream: FirebaseFirestore.instance.collection('books').snapshots(),
                    builder: (BuildContext context, AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snapshot) {
                      //print("get data ${snapshot.data!.docs}");
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

                      return GridView.builder(
                        physics: BouncingScrollPhysics(),
                        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          childAspectRatio: 2 / 3,
                        ),
                        itemCount: snapshot.data!.docs.length,
                        //shrinkWrap: true,
                        itemBuilder: (context, index) {
                         var data = snapshot.data!.docs[index];
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: GestureDetector(
                                onTap: (){
                                  //print("get data ${data}");
                                  (_.user!.uid == "J0KRcOT1oIOaiugO3uzEHhvUSKz2") ?
                                  Get.to(AdminView(opertionName: BookStoreString.updateValue,getIndex: index,),arguments: data,):
                                  Get.to(DetailsView() ,arguments: index);
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: Column(
                                    //mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      ClipRRect(
                                        child: Image.network(data['image'],
                                          height: height / 3.9,
                                          fit: BoxFit.fill,
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(top: 5,bottom: 3),
                                        child: Align(
                                          alignment: Alignment.topLeft,
                                          child: Text("${data['name']}",
                                            style: CustomFontStyle.style16PrmW600,
                                          ),
                                        ),
                                      ),
                                      Align(
                                        alignment: Alignment.topLeft,
                                        child: Text("\$${data['price']}",
                                          style: CustomFontStyle.style14PrmW600,
                                        ),
                                      )
                                    ],
                                  ),
                                )
                            ),
                          );
                        },
                      );
                    },
                  ),
                ),
              ),
              SizedBox(height: height / 2,)
            ],
          ),
        ),
      ],
    );
  }
}
