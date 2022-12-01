import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';


class SpecialOfferCard extends StatelessWidget {
  final String img;
  final String category;
  final int numOfBrands;

  SpecialOfferCard({this.img, this.category, this.numOfBrands});


  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 60.w,height: 14.h,
      child: ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: Stack(
            children: [
              Image.asset(img,fit: BoxFit.cover,),
              Container(
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Color(0XFF343434).withOpacity(0.4),
                          Color(0XFF343434).withOpacity(0.15)
                        ]
                    )
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 1.5.h,horizontal: 1.w),
                child: Text.rich(TextSpan(
                    children: [
                      TextSpan(text: "$category \n",
                          style: TextStyle(fontSize: 13.sp,color: Colors.white,fontWeight: FontWeight.bold)),
                      TextSpan(text: "$numOfBrands Brand",style: TextStyle(color: Colors.white)),
                    ]
                )),
              )
            ],
          )),
    );
  }
}