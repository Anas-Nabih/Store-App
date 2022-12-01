import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sizer/sizer.dart';


class ProfilePicture extends StatelessWidget {
  const ProfilePicture({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      // overflow: Overflow.visible,
      children: [
        Container(
          height: 16.h,width: 16.h,
          padding: EdgeInsets.all(2.w),
          decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: Colors.grey[100],width: 3),
              image: DecorationImage(
                  image: AssetImage("assets/images/Anas.png")
              )
          ),
        ),
        Positioned(
          bottom: .5.h,right: -1.w,
          child: Container(
            height: 5.h,width: 5.h,
            decoration: BoxDecoration(
                color: Colors.grey[100],
                shape: BoxShape.circle,
                border: Border.all(color: Colors.white)
            ),
            child: Padding(
              padding: EdgeInsets.all(2.w),
              child: SvgPicture.asset("assets/icons/Camera Icon.svg"),
            ),
          ),
        )
      ],
    );
  }
}