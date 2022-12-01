import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sizer/sizer.dart';
import 'package:store_app/constants.dart';


class MoreItem extends StatelessWidget {

  final String icon;
  final String title;
  final bool isLogOut;
  final Function onTapped;

  MoreItem({this.icon, this.title, this.isLogOut = false,this.onTapped});



  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTapped ?? (){},
      child: Container(
        height: 8.h,
        margin: EdgeInsets.symmetric(vertical: 1.5.h),
        padding: EdgeInsets.symmetric(horizontal: 3.w),
        decoration: BoxDecoration(
            color: kSecondaryColor.withOpacity(0.1),
            borderRadius: const BorderRadius.all(Radius.circular(16))
        ),
        child: Row(
          children: [
            SvgPicture.asset(icon,color: kPrimaryColor,),
            SizedBox(width: 4.w,),
            Text(title,style: TextStyle(
                color: Colors.black.withOpacity(0.8),fontSize: 11.sp,fontWeight: FontWeight.w400
            ),),
            Spacer(),
            isLogOut ? Container() :SvgPicture.asset("assets/icons/arrow_right.svg")
          ],
        ),
      ),
    );
  }
}