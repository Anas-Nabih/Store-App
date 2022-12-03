import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:store_app/models/product_model.dart';
import 'package:store_app/ui/widgets/api_csutom_card.dart';

class Products extends StatelessWidget {
  const Products({this.productList});

 final List<ProductModel> productList;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 38.h,
      child: ListView.builder(
          physics: BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
          itemCount: productList.length,
          itemBuilder: (context, index) =>ApiCustomCard(product: productList[index],)),
    );
  }
}
