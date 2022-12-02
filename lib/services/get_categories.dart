
import 'package:store_app/helper/api.dart';
import 'package:store_app/helper/const.dart';

class Categories {
  Future<List<dynamic>> getAllCategories() async {
    List<dynamic> data = await Api.get(endPoint: Const.categoriesEP);
    return data;
  }
}
