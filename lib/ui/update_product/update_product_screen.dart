import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:sizer/sizer.dart';
import 'package:store_app/constants.dart';
import 'package:store_app/models/product_model.dart';
import 'package:store_app/services/update_product.dart';
import 'package:store_app/ui/widgets/custom_text_form_field.dart';
import 'package:store_app/ui/widgets/defult_button.dart';

class UpdateProductScreen extends StatefulWidget {
  UpdateProductScreen({Key key}) : super(key: key);

  static const String routeName = "/editProductScreen";

  @override
  State<UpdateProductScreen> createState() => _UpdateProductScreenState();
}

class _UpdateProductScreenState extends State<UpdateProductScreen> {
  String productName, productImg, productDesc, productPrice;

  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    ProductModel product = ModalRoute.of(context).settings.arguments;
    print(product.title);
    return ModalProgressHUD(
      inAsyncCall: isLoading,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: kPrimaryColor,
          title: Text(product.title),
          centerTitle: true,
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 4.w),
          child: ListView(
            children: [
              SizedBox(height: 10.h),
              CustomTextFormField(
                  onChanged: (val) => productName = val,
                  hintText: "Product Name"),
              CustomTextFormField(
                  onChanged: (val) => productDesc = val,
                  hintText: "Description"),
              CustomTextFormField(
                  onChanged: (val) => productPrice = val,
                  hintText: "Price",
                  inputType: TextInputType.number),
              CustomTextFormField(
                  onChanged: (val) => productImg = val, hintText: "image"),
              SizedBox(height: 6.h),
              DefaultButton(
                text: "Update",
                onPressed: () async{
                  setState(() {
                    isLoading = true;
                  });
                  try {
                    await UpdateProductService().updateProduct(
                        id: "${product.id}",
                        title: productName ?? product.title ,
                        price: productPrice ?? "50",
                        description: productDesc ?? product.description,
                        image: productImg ?? product.image,
                        category: product.category);
                    print("success");
                   } catch (e) {
                    print(e.toString());
                    print("failed");
                   }
                  setState(() {
                    isLoading = false;
                  });
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
