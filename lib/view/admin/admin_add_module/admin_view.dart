import 'package:book_store/app_export.dart';
import 'package:book_store/base_class/base_sizedbox.dart';
import 'package:book_store/base_class/base_textStyle.dart';
import '../../../base_class/base_raisedButton.dart';
import '../../../base_class/base_textfield.dart';
import 'admin_controller.dart';

class AdminView extends StatelessWidget {
  String opertionName;
   int getIndex;
   AdminView({Key? key , required this.opertionName , required this.getIndex}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print("hget index ${getIndex}");
    return GetBuilder(
      init: AdminController(),
        builder: (_){
          return Scaffold(
            appBar: AppBar(
              leading: IconButton(
                onPressed: (){Get.back();},
                icon: Icon(Icons.arrow_back , color: BookStoreColor.primaryColor,),
                
              ),
              title:  Text((opertionName == BookStoreString.addValue) ? "Add Item "  : "Update And Delete Value", style: CustomFontStyle.style20PrmW900,),centerTitle: true,
              elevation: 0,
              backgroundColor: BookStoreColor.white.withOpacity(0.2),
            ),
            body: mainBody(_ , context),
          );
        },
    );
  }

  mainBody(AdminController _ , BuildContext context){
    double height = MediaQuery.of(context).size.height,
        width = MediaQuery.of(context).size.width;
    return SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15 , vertical: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              CustomSizedBox.sizedBox(height: 20),
              BaseTextField.textField(
                controller: _.imageController ,
                textInputType: TextInputType.emailAddress,
                placeholder: BookStoreString.imageHint,
                //prefix: IconPath.user,
              ),
              CustomSizedBox.sizedBox(height: 40),
              BaseTextField.textField(
                controller: _.nameController,
                textInputType: TextInputType.emailAddress,
                placeholder: BookStoreString.nameHint,
                //prefix: IconPath.user,
              ),
              CustomSizedBox.sizedBox(height: 40),
              BaseTextField.textField(
                controller: _.priceController,
                textInputType: TextInputType.emailAddress,
                placeholder: BookStoreString.priceHint,
                //prefix: IconPath.user,
              ),
              CustomSizedBox.sizedBox(height: 40),
              (opertionName == BookStoreString.addValue) ? SizedBox(
                width: width,
                child: BaseRaisedButton(
                  borderRadius: 16,
                  buttonText: "Add Item",
                  onPressed: () {
                    _.checkValidation();
                  },

                ),
              ) : Row(
                children: [
                  Expanded(child: SizedBox(
                    width: width,
                    child: BaseRaisedButton(
                      borderRadius: 16,
                      buttonText: "Update Item",
                      onPressed: () {
                        _.updateDetails(index: getIndex);
                        //_.checkValidation();
                      },

                    ),
                  )),
                  CustomSizedBox.sizedBox(width: 10),
                  Expanded(child: SizedBox(
                    width: width,
                    child: BaseRaisedButton(
                      borderRadius: 16,
                      buttonText: "Delete Item",
                      onPressed: () {
                        _.deleteData(index: getIndex);
                        //_.checkValidation();
                      },

                    ),
                  ))
                ],
              ),
            ],
          ),
        ),
    );
  }

}
