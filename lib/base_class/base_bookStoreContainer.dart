import 'package:book_store/app_export.dart';
import 'package:book_store/view/homepage_module/homepage_controller.dart';

import 'base_textStyle.dart';

// class CustomBookStoreContainer{
//
//   static bookStoreContainer(dynamic onTap , double height){
//     return GestureDetector(
//       onTap: onTap,
//         child: Container(
//           decoration: BoxDecoration(
//             borderRadius: BorderRadius.circular(10),
//           ),
//           child: Column(
//             //mainAxisAlignment: MainAxisAlignment.start,
//             crossAxisAlignment: CrossAxisAlignment.center,
//             children: [
//               ClipRRect(
//                 child: Image.asset(
//                   Utils.getAssetsJpgImg(HomePageController.getData[0]['images']),
//                   height: height / 3.9,
//                   fit: BoxFit.fill,
//                 ),
//               ),
//               Padding(
//                 padding: const EdgeInsets.only(top: 5,bottom: 3),
//                 child: Align(
//                   alignment: Alignment.topLeft,
//                   child: Text(
//                     BookStoreString.masterYourEmotions,
//                     style: CustomFontStyle.style16PrmW600,
//                   ),
//                 ),
//               ),
//               Align(
//                 alignment: Alignment.topLeft,
//                 child: Text("\$200",
//                   style: CustomFontStyle.style14PrmW600,
//                 ),
//               )
//             ],
//           ),
//         )
//     );
//   }
//
// }