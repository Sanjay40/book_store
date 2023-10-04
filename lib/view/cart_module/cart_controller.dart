import 'package:book_store/app_export.dart';

class CartController extends GetxController{
  CollectionReference watch = FirebaseFirestore.instance.collection('watches');


  Future<void> deleteWatch(String id) {
    return watch
        .doc(id)
        .delete()
        .then((value) => print("User Deleted"))
        .catchError((error) => print("Failed to delete user: $error"));
  }
}