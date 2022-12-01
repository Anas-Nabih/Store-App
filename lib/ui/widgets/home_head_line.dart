import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class BuildHeadLine extends StatelessWidget {
  String title;
  BuildHeadLine({
    this.title,});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:EdgeInsets.symmetric(horizontal: 2.w,vertical: 2.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title,style: TextStyle(
              fontSize: 14.sp,fontWeight: FontWeight.w700
          ),),
          Text("See more"),
        ],
      ),
    );
  }
}