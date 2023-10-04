import 'package:book_store/app_export.dart';
import 'package:book_store/helper/firebase_helper.dart';
import 'package:book_store/model/firebase_model.dart';

class DetailsController extends GetxController{

  int performValueGet = 1;

  incrementFunc(){
    if(performValueGet >= 1) {
      performValueGet++;
    }
    // }else{
    //   performValueGet = 10;
    // }
    update();
  }

  decrementFunc(){
    if(performValueGet > 1){
      performValueGet--;
    }else{
      performValueGet = 1;
    }
    update();
  }

  //var data = [];

  //performFavouriteIcon(int index){
    //data[index]['like'] = !data[index]['like'];
    //var userData = Product(like: data[index]['like'], cart: data[index]['cart']);
   // FirebaseHelper.dataUpdate(id: index, value: data[index]['like']);
    //debugPrint("====== data ${data[index]['like']}");
    //update();
  //}



}