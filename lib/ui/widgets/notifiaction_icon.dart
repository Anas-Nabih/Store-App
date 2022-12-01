import 'package:sizer/sizer.dart';
import 'package:flutter/material.dart';
import 'package:store_app/constants.dart';
import 'package:flutter_svg/flutter_svg.dart';


class NotificationIcon extends StatelessWidget {
  final String img;
  final int num;
  final GestureTapCallback onPress;


  NotificationIcon({this.img, this.num, this.onPress});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPress?? (){},
      borderRadius: BorderRadius.circular(50),
      child: Stack(
        // overflow: Overflow.visible,
        children: [
          Container(
            width: 5.h,height: 5.h,
            padding: const EdgeInsets.all(2),
            margin: EdgeInsets.symmetric(horizontal: 2),
            decoration: BoxDecoration(
              color: kSecondaryColor.withOpacity(0.2),
              shape: BoxShape.circle,
            ),
            child: Padding(
              padding: const EdgeInsets.all(6),
              child: SvgPicture.asset(img),
            ),
          ),
          if(num !=0)
            Positioned(
              top: -2,
              right: 0.w,
              child: Container(
                height: 13,width: 20,
                decoration: BoxDecoration(
                    color: Colors.red,
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.white)
                ),
                child: Center(
                  child: Text("$num",style: TextStyle(
                      fontSize: 6.sp,color: Colors.white
                  ),),
                ),
              ),
            )
        ],
      ),
    );
  }
}