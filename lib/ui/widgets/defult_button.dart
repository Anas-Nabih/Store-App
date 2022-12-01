import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:store_app/constants.dart';

class DefaultButton extends StatelessWidget {
  Function onPressed;
  String text;
   DefaultButton({this.onPressed,this.text}) ;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,height: 50,
      decoration: BoxDecoration(
        color: kPrimaryColor,
        borderRadius: BorderRadius.circular(15)
      ),
      child: GestureDetector(
        onTap: onPressed,
        child: Center(child: Text(text??"Continue",
        style: TextStyle(color:kWhite,fontSize: 16.sp,fontWeight: FontWeight.w600 ),)),
      ),
    );
  }
}
