import 'package:flutter/material.dart';
import 'package:store_app/constants.dart';
import 'package:sizer/sizer.dart';

AppBar buildCartAppBar({int items, BuildContext context}) {
  return AppBar(
    backgroundColor: Colors.transparent,
    centerTitle: true,
    title: Column(
      children: [
        Text("Your Cart",style: TextStyle(color: kSecondaryColor,fontSize: 14.sp),),
        Text("${items} items",style: TextStyle(
            color: kSecondaryColor.withOpacity(0.5),
            fontSize: 10.sp
        )),

      ],
    ),
    leading: IconButton(icon: Icon(Icons.arrow_back_ios_new),color: Colors.black,
    onPressed: ()=>Navigator.pop(context),),
  );
}