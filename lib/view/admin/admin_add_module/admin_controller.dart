import 'package:book_store/app_export.dart';

class AdminController extends GetxController{

  var getData = Get.arguments;

  void onInit() {
    // TODO: implement onInit
    super.onInit();

     if(getData != null) {
       imageController.text = getData['image'] ?? '';
        print("============ get data ${getData['image']} and imagecontroller ${imageController.text}");
        nameController.text = getData['name'] ?? '';
        priceController.text = getData['price'] ?? '';
     }
  }

  TextEditingController
      imageController = TextEditingController(),
      nameController = TextEditingController(),
      priceController = TextEditingController();

  checkValidation(){
    if (imageController.text.isEmpty) {
      Utils.showToast("Please Upload Image");
    } else if (nameController.text.trim().isEmpty) {
      Utils.showToast("Please Enter name");
    } else if (priceController.text.trim().isEmpty) {
      Utils.showToast("Please Enter price");
  }else{
      addImageToFirestore();
      imageController.clear();
      nameController.clear();
      priceController.clear();
    }
  }

  Future<void> addImageToFirestore() async {
    final FirebaseFirestore firestore = FirebaseFirestore.instance;
    //Utils.showCircularProgressLottie(true);
    await firestore.collection('books').add({
      'image': imageController.text.trim(),
      'name': nameController.text.trim(),
      'price': "${priceController.text.trim()}",
      'cart': false,
      'like': false,
    });
    //Utils.showCircularProgressLottie(false);
    Get.back();
  }

  Future<void> updateDetails({required int index}) async {
    CollectionReference booksData =
    FirebaseFirestore.instance.collection('books');
    var docSnap = await booksData.get();
    var docId = docSnap.docs;
    return booksData
        .doc(docId[index].id)
        .update({
        'image': imageController.text.trim(),
       'name': nameController.text.trim(),
        'price': "${priceController.text.trim()}",
    })
        .then((value) => Get.back())
        .catchError((error) => print("Failed to update user: $error"));
  }

  deleteData({required int index}) async {
    CollectionReference booksData =
    FirebaseFirestore.instance.collection('books');
    var docSnap = await booksData.get();
    var docId = docSnap.docs;
    return booksData
        .doc(docId[index].id)
        .delete()
        .then((value) => Get.back())
        .catchError((error) => print("error  : $error"));
  }

}