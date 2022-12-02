
import 'package:store_app/helper/api.dart';
import 'package:store_app/helper/const.dart';
import 'package:store_app/models/product_model.dart';

class CategoriesServices {
  Future<List<ProductModel>> getCategoriesProducts({String catName}) async {

    List<dynamic> data =
        await Api.get(endPoint: "${Const.categoryProductEP}$catName");

    List<ProductModel> productsList = [];

    for (int i = 0; i < data.length; i++) {
      productsList.add(ProductModel.fromJson(data[i]));
    }

    return productsList;
  }
}
