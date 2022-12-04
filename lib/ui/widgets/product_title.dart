import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';


class ProductTitle extends StatelessWidget {
  const ProductTitle({
    Key key,
    @required this.productTitle,
  }) : super(key: key);

  final String productTitle;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 2.w, vertical: 2.h),
      child: Text(
        productTitle,
        style:
        TextStyle(color: Colors.black, fontSize: 16.sp),
      ),
    );
  }
}