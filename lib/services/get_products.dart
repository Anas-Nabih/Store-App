import 'package:store_app/helper/api.dart';
import 'package:store_app/helper/const.dart';
import 'package:store_app/models/product_model.dart';

class GetAllProduct {
  static Future<List<ProductModel>> getAllProduct() async {

    List<dynamic> data = await Api.get(endPoint: Const.productsEP);


    List<ProductModel> productsList = [];

    for (int i = 0; i < data.length; i++) {
      productsList.add(ProductModel.fromJson(data[i]));
    }

     return productsList;
  }
}
