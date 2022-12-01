  import 'package:store_app/constants.dart';
import 'package:store_app/ui/home_screen/HomeProvider.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

  class DotsIndicator extends StatelessWidget {
  const DotsIndicator({

    @required this.dotsLength,
    @required this.provider,
  });

  final int dotsLength;
  final HomeProvider provider;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 1.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(
            dotsLength,
                (index) => AnimatedContainer(
              duration: Duration(milliseconds: 200),
              height: 1.h,
              width: 2.w,
              margin: EdgeInsets.symmetric(horizontal: 1.w),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                  color: provider.animatedIndex == index
                    ? kPrimaryColor
                    : kPrimaryColor.withOpacity(0.2),
              ),
            )),
      ),
    );
  }
}
