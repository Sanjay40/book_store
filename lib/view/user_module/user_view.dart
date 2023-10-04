import 'package:book_store/base_class/base_textStyle.dart';
import 'package:book_store/view/user_module/user_controller.dart';

import '../../app_export.dart';
import '../../base_class/base_dialog.dart';
import '../../base_class/base_sizedbox.dart';

class UserView extends StatelessWidget {
  const UserView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
        init: UserController(),
        builder: (_) {
          return Scaffold(
            body: mainBody(_),
          );
        });
  }

  mainBody(UserController _) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20 , vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(BookStoreString.user,style: CustomFontStyle.style20PrmW900),
            CustomSizedBox.sizedBox(height: 40),
            CircleAvatar(
              radius: 40,
              backgroundColor: BookStoreColor.primaryColor,
              child: Center(
                child: Icon(Icons.person, color: BookStoreColor.white, size: 30),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Text("UmangKaklotar@gmail.com" , style: CustomFontStyle.style16PrmW600,),
            ),
            //  GestureDetector(
            //   onTap: (){
            //
            //   },
            //   child: Container(
            //     width: 400,
            //     margin: EdgeInsets.symmetric(vertical: 30),
            //     decoration: BoxDecoration(
            //       color: BookStoreColor.primaryColor,
            //       borderRadius: BorderRadius.circular(10),
            //     ),
            //     padding: EdgeInsets.symmetric(vertical: 15 , horizontal: 20),
            //     child: Text("Add Item" , style: CustomFontStyle.style16WhiteW600,)
            //
            //   ),
            // ) : Container(),
            GestureDetector(
              onTap: (){
                CustomDialog.customDialog(onTap: (){_.logOutButton();}, title: BookStoreString.logOutTitle ,actionTitle: BookStoreString.cancel);
              },
              child: Container(
                margin: EdgeInsets.only(top: 20),
                decoration: BoxDecoration(
                  color: BookStoreColor.primaryColor,
                  borderRadius: BorderRadius.circular(10),
                ),
                padding: EdgeInsets.symmetric(vertical: 15 , horizontal: 20),
                child: Row(
                  children: [
                    Icon(Icons.logout , size: 18,color: BookStoreColor.white,),
                    CustomSizedBox.sizedBox(width: 20),
                    Text(BookStoreString.logOut , style: CustomFontStyle.style16WhiteW600,)
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// import 'dart:ui';
//
// import 'package:book_store/view/user_module/user_controller.dart';
//
// import '../../app_export.dart';
//
// class UserView extends StatelessWidget {
//   const UserView({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return GetBuilder(
//         init: UserController(),
//         dispose: (_) => Get.delete<UserController>(),
//         builder: (_) {
//           return Scaffold(
//             body: mainBody(_),
//           );
//         });
//   }
// }
//
// mainBody(UserController _) {
//   return SafeArea(
//     child: ListView(
//       padding: EdgeInsets.all(20),
//       physics: BouncingScrollPhysics(),
//       children: [
//         CircleAvatar(
//           radius: 50,
//           backgroundColor: BookStoreColor.primaryColor,
//           // backgroundImage: (profiles[0].userID.isEmpty)
//           //     ? NetworkImage(profiles[0].profileImage)
//           //     : null,
//           child: Center(
//             child: Icon(Icons.person, color: BookStoreColor.white, size: 50),
//           ),
//         ),
//         // SizedBox(
//         //   height: Utils.getSize(10),
//         // ),
//         BaseText(
//           text: '111111',
//           //text: profiles[0].userID,
//           fontWeight: FontWeight.w700,
//           color: BookStoreColor.primaryColor,
//           textAlign: TextAlign.center,
//         ),
//         BaseText(
//           text: '111111',
//           //text: profiles[0].email,
//           fontWeight: FontWeight.w500,
//           textAlign: TextAlign.center,
//         ),
//         // SizedBox(
//         //   height: Utils.getSize(10),
//         // ),
//         // (_.user!.uid == StringRes.adminUID)
//         //     ? getButton(
//         //   onTap: () {
//         //     Get.to(WatchListView(), transition: Transition.cupertino);
//         //   },
//         //   title: "Watch List",
//         //   icon: Icon(
//         //     Icons.watch,
//         //     color: ColorRes.primaryColor,
//         //   ),)
//         //     : Container(),
//         SizedBox(
//           height: 10,
//         ),
//         SizedBox(
//           height: 10,
//         ),
//         getButton(
//             onTap: () {
//               showDialogBox(() {
//                 //_.logOutButton();
//               });
//             },
//             title: "Log out",
//             icon: Icon(
//               Icons.logout,
//               color: BookStoreColor.primaryColor,
//             )),
//       ],
//     ),
//   );
// }
//
// // getProfile(){
// //   return ;
// // }
//
// getButton(
//     {required Icon icon, required String title, required Function()? onTap}) {
//   return GestureDetector(
//     onTap: onTap,
//     child: Container(
//       height: 50,
//       width: Get.width,
//       decoration: BoxDecoration(
//         color: BookStoreColor.transparent,
//       ),
//       child: Row(
//         children: [
//           icon,
//           SizedBox(
//             width: 30,
//           ),
//           Expanded(
//             child: BaseText(
//               text: title,
//               fontSize: 20,
//               fontWeight: FontWeight.w600,
//               color: BookStoreColor.grey,
//             ),
//           ),
//           Container(
//             height: 30,
//             width: 30,
//             alignment: Alignment.center,
//             child: Icon(
//               Icons.arrow_forward_ios,
//               color: BookStoreColor.grey.withOpacity(0.4),
//             ),
//           )
//         ],
//       ),
//     ),
//   );
// }
//
// showDialogBox(Function successCallback) {
//   return Get.dialog(BackdropFilter(
//     filter: ImageFilter.blur(sigmaX: 2, sigmaY: 2),
//     child: Center(
//       child: Stack(
//         alignment: AlignmentDirectional.center,
//         children: [
//           Container(
//             margin: EdgeInsets.symmetric(
//                 horizontal: 52, vertical: 50,),
//             decoration: BoxDecoration(
//               color: BookStoreColor.white,
//               borderRadius: BorderRadius.circular(16),
//             ),
//             child: Column(
//               mainAxisSize: MainAxisSize.min,
//               children: [
//                 SizedBox(height: 34),
//                 Padding(
//                   padding: EdgeInsets.only(
//                       left: 30, right: 30),
//                   child: BaseText(
//                     text: "Are you sure you want to log out of the App?",
//                     fontWeight: FontWeight.w500,
//                     fontSize: 20,
//                     color: BookStoreColor.black,
//                     textAlign: TextAlign.center,
//                   ),
//                 ),
//                 //SizedBox(height: Utils.getSize(26)),
//                 Padding(
//                   padding: EdgeInsets.only(
//                       right:16, left: 16,
//                   ),
//                   child: Row(
//                     children: [
//                       Expanded(
//                         child: GestureDetector(
//                           onTap: () {
//                             Get.back();
//                           },
//                           child: Container(
//                             padding: EdgeInsets.symmetric(
//                                 vertical: 14.5,
//                                 horizontal: 16),
//                             decoration: BoxDecoration(
//                                 borderRadius: BorderRadius.circular(8),
//                                 border: Border.all(
//                                     color: BookStoreColor.black, width: 1),
//                                 color: BookStoreColor.white),
//                             child: BaseText(
//                               text: "Cancel",
//                               fontWeight: FontWeight.w500,
//                               fontSize: 18,
//                               color: BookStoreColor.black,
//                               textAlign: TextAlign.center,
//                             ),
//                           ),
//                         ),
//                       ),
//                       //SizedBox(width: Utils.getSize(8)),
//                       Expanded(
//                         child: GestureDetector(
//                           onTap: () {
//                             successCallback();
//                           },
//                           child: Container(
//                             padding: EdgeInsets.symmetric(
//                                 vertical: 14.5,
//                                 horizontal: 16),
//                             decoration: BoxDecoration(
//                                 borderRadius: BorderRadius.circular(8),
//                                 border: Border.all(
//                                     color: BookStoreColor.primaryColor, width: 1),
//                                 color: BookStoreColor.primaryColor),
//                             child: BaseText(
//                               text: "Yes",
//                               fontWeight: FontWeight.w500,
//                               fontSize: 18,
//                               color: BookStoreColor.white,
//                               textAlign: TextAlign.center,
//                             ),
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//                 // SizedBox(
//                 //   height: Utils.getSize(16),
//                 // ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     ),
//   ));
// }
