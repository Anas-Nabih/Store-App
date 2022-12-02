import 'dart:convert';

import 'package:store_app/models/product_model.dart';
import 'package:http/http.dart' as http;

class GetAllProduct {
  static Future<List<ProductModel>> getAllProduct() async {
    
    http.Response response =
        await http.get(Uri.parse("https://fakestoreapi.com/products"));

    List<dynamic> data = jsonDecode(response.body);

    List<ProductModel> productsList = [];

    for (int i = 0; i < data.length; i++) {
      productsList.add(ProductModel.fromJson(data[i]));
    }

    return productsList;
  }
}
