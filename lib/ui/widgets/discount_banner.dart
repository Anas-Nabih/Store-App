import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class DiscountBanner extends StatelessWidget {
  const DiscountBanner({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 2.w,top: 2.h,bottom: 2.h,right: 4.w),
      padding: EdgeInsets.symmetric(horizontal: 3.w,vertical: 2.h),
      height: 12.h,
      width: double.infinity,
      decoration: BoxDecoration(
          color: Colors.deepPurple,
          borderRadius: const BorderRadius.all(Radius.circular(12))
      ),child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("A summer surprise",style: TextStyle(
            color: Colors.white,fontSize: 10.sp,fontWeight: FontWeight.w400
        ),),
        SizedBox(height: 1.h,),
        Text("CashBack 20%",style: TextStyle(
            color: Colors.white,fontSize: 15.sp,fontWeight: FontWeight.w600
        ),),
      ],
    ),
    );
  }
}