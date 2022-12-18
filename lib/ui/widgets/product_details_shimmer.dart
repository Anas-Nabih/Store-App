import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:sizer/sizer.dart';
import 'package:store_app/res/colors.dart';

class ProductDetailsShimmer extends StatelessWidget {
  const ProductDetailsShimmer({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: MColors.shimmerBaseColor,
      highlightColor: MColors.shimmerHighlightColor,
      child: Column(
        children: [
          Container(
            width: double.infinity,
            height: 35.h,
            margin: EdgeInsets.symmetric(vertical: 2.h,horizontal: 8.w),
            decoration: BoxDecoration(
              color: Colors.red,
              borderRadius: BorderRadius.circular(12)
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ...List.generate(
                4, (index) => Container(
                  height: 7.h,
                  width: 12.w,
                  margin: const EdgeInsets.symmetric(horizontal: 5),
                  padding: const EdgeInsets.all(5),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              )
            ],
          ),
          Expanded(
            child: Container(
              padding: EdgeInsets.only(top: 2.h),
              margin: EdgeInsets.only(top: 4.h,),
              width: double.infinity,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(30),
                    topLeft: Radius.circular(30),
                  )),

            ),
          ),
        ],
      ),
    );
  }
}
