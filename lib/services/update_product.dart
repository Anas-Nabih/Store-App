import 'package:store_app/helper/api.dart';
import 'package:store_app/helper/const.dart';
import 'package:store_app/models/product_model.dart';
import 'package:flutter/material.dart';

class UpdateProduct {
  Future<ProductModel> updateProduct({
    @required String id,
    @required String title,
    @required String price,
    @required String description,
    @required String image,
    @required String category,
  }) async {
    Map<String, dynamic> data =
        await Api.put(endPoint: "${Const.productsEP}/$id", body: {
      "title": title,
      "price": price,
      "description": description,
      "image": image,
      "category": category
    });

    return ProductModel.fromJson(data);
  }
}
