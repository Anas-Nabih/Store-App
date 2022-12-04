import 'package:store_app/helper/api.dart';
import 'package:store_app/helper/const.dart';
import 'package:store_app/models/product_model.dart';

class GetProductById {
  static Future<ProductModel> getProductById({int id}) async {

    var data = await Api.get(endPoint: "${Const.productsEP}/$id");

    return ProductModel.fromJson(data);
  }
}