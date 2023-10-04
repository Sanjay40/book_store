import 'package:book_store/model/firebase_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FirebaseHelper{
  static CollectionReference productData = FirebaseFirestore.instance.collection('books');

  // Future addFavouriteOrCartProduct({required Product product, required String key}) async {
  //   Loader.loader();
  //   QuerySnapshot collection = await customerCollection.get();
  //   List<QueryDocumentSnapshot<Object?>> docId = collection.docs;
  //   DocumentReference userRef = customerCollection.doc(docId[0].id);
  //   DocumentSnapshot userSnapshot = await userRef.get();
  //   List existingArray = userSnapshot.get(key);
  //   existingArray.add(product.toJson());
  //   Set removeData = {};
  //   List<Map<String, dynamic>> uniqueList = [];
  //   for (var item in existingArray) {
  //     if(key == 'fav') {
  //       if (removeData.add(item['product_name'])) {
  //         uniqueList.add(item);
  //       }
  //     }
  //     if(key == 'cart') {
  //       if (removeData.add(item)) {
  //         uniqueList.add(item);
  //       }
  //     }
  //   }
  //   return await userRef.update({key: uniqueList})
  //       .then((value) {
  //     Get.back();
  //     debugPrint("Product Added..");
  //     CustomToast.toast(msg: 'Successfully Added...');
  //   })
  //       .catchError((error) {
  //     Get.back();
  //     debugPrint("Failed to add: $error");
  //     CustomToast.toast(msg: 'Failed...');
  //   });
  // }

  // static dataUpdate({required int id,required bool value}) async {
  //   var docSnap = await productData.get();
  //   var docId = docSnap.docs;
  //   print("===== doc id ${docId}");
  //   return productData
  //       .doc(docId[id].id)
  //       .update({'like' : value})
  //       .then((value) => print("data Update"))
  //       .catchError((error) => print("error : ${error}"));
  // }

  static updateData({required String index, required bool changeFavData}) async {
    // CollectionReference collection = FirebaseFirestore.instance .collection('Order_food_list')
    //     .doc('All_food_list')
    //     .collection(homeController.category.value);
    // CollectionReference collection = FirebaseFirestore.instance.collection('Order_list')
    //     .where('category',isEqualTo :homeController.category.value);

    //QuerySnapshot data = await collection.where('category',isEqualTo :homeController.category.value).get();

    // Stream<QuerySnapshot<Map<String, dynamic>>> collection = FirebaseFirestore.instance.collection('Order_list')
    //     .where('category',isEqualTo :homeController.category.value).snapshots();
    print("object $changeFavData");
    var docSnap = await productData.get();
    //var docId = docSnap.docs;
    return productData
        .doc(index)
        .update({'like' : !changeFavData})
        .then((value) => print("User Update") )
        .catchError((error) => print("Error $error"));

  }

  static updateCartData({required String index, required bool changeCartData}) async {
    // CollectionReference collection = FirebaseFirestore.instance .collection('Order_food_list')
    //     .doc('All_food_list')
    //     .collection(homeController.category.value);
    // CollectionReference collection = FirebaseFirestore.instance.collection('Order_list')
    //     .where('category',isEqualTo :homeController.category.value);

    //QuerySnapshot data = await collection.where('category',isEqualTo :homeController.category.value).get();

    // Stream<QuerySnapshot<Map<String, dynamic>>> collection = FirebaseFirestore.instance.collection('Order_list')
    //     .where('category',isEqualTo :homeController.category.value).snapshots();
    print("object $changeCartData");
    var docSnap = await productData.get();
    //var docId = docSnap.docs;
    return productData
        .doc(index)
        .update({'cart' : !changeCartData})
        .then((value) => print("User Update") )
        .catchError((error) => print("Error $error"));

  }
}