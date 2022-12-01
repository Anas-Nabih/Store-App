import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../../constants.dart';

class SplashContent extends StatelessWidget {
  String text, images;
  SplashContent({
    Key key,this.text,this.images
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Spacer(),
        Text("Shop App",
          style: TextStyle(color: kPrimaryColor,
              fontWeight: FontWeight.bold,fontSize: 20.sp),),
        Spacer(),
        Text(text,textAlign: TextAlign.center,),
        Spacer(flex: 1,),
        Image.asset(images,height: 50.h,width: 60.w,)
      ],
    );
  }
}