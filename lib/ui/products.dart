import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:store_app/models/product_model.dart';

class Products extends StatelessWidget {
  const Products({this.products});

 final List<ProductModel> products;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 20.h,
      child: GridView.builder(
        physics: NeverScrollableScrollPhysics(),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            mainAxisExtent: 20.h,
            crossAxisCount: 2,
          ),
          itemCount: 2,
          itemBuilder: (context, index) =>Container(
            margin: EdgeInsets.all(1.h),
             width: 5.w,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
              boxShadow: [
                BoxShadow(
                  color: Colors.black12,
                  blurRadius: 2,
                  spreadRadius: 2,
                  offset: Offset(2,3)
                )
              ]
            ),
            child: Text(products[index].title),
          )),
    );
  }
}
