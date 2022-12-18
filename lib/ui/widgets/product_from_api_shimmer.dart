import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:sizer/sizer.dart';
import 'package:store_app/res/colors.dart';

class ProductFromApiShimmer extends StatelessWidget {
  const ProductFromApiShimmer({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
        baseColor: MColors.shimmerBaseColor,
        highlightColor: MColors.shimmerHighlightColor,
      child: Container(
        height: 38.h,
        child: ListView.separated(
            separatorBuilder: (context, index) => SizedBox(width: 4.w),
            physics: BouncingScrollPhysics(),
            scrollDirection: Axis.horizontal,
            itemCount: 6,
            itemBuilder: (context, index) => Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: 25.h,
                      width: 38.w,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12)),
                    ),
                    SizedBox(height: 1.h),
                    Container(
                      width: 20.w,
                      height: 2.h,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12)),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          width: 10.w,
                          height: 2.h,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(12)),
                        ),
                        SizedBox(width: 20.w),
                        Container(
                          width: 10.w,
                          height: 4.h,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            shape: BoxShape.circle,
                          ),
                        ),
                      ],
                    )
                  ],
                )),
      ),
    );
  }
}
