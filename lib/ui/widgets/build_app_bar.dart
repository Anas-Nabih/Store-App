import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

AppBar buildAppBar({String text, Function onPressed, bool isPressed = false}) {
  return AppBar(
    centerTitle: true,
    backgroundColor: Colors.transparent,
    title: Text(text,style: TextStyle(color: Color(0xFF8B8B8B),fontSize: 13.sp),),
    leading: isPressed ?IconButton(
      icon:Icon(Icons.arrow_back_ios,color: Color(0xFF8B8B8B)),
      onPressed: onPressed??(){},) : Container(),

  );
}