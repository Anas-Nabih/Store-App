import 'package:store_app/ui/product_details/product_details_provider.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';


class CountButton extends StatelessWidget {
  final IconData iconData;
  final Function onPressed;
  final ProductDetailsProvider provider;


  CountButton({this.iconData, this.onPressed, this.provider});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed?? (){},
      child: Container(
        width: 8.w,height: 4.h,
        decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.white
        ),
        child: Icon(iconData,size: 5.w,),
      ),
    );
  }
}