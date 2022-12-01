import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sizer/sizer.dart';

class SocialCard extends StatelessWidget {
  String svgImg;
  Function onTapped;
  SocialCard({
    this.svgImg,this.onTapped
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTapped ?? (){},
      child: Container(
        height: 6.h, width: 10.w,
        padding: EdgeInsets.all(12),
        margin: EdgeInsets.symmetric(vertical: 1.h,horizontal: 2.w),
        decoration: BoxDecoration(
            color: Color(0xFFF5F6F9),
            borderRadius: BorderRadius.circular(12)
        ),
        child: SvgPicture.asset(svgImg),
      ),
    );
  }
}