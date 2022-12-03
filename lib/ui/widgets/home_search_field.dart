import 'package:store_app/ui/search_screen/search_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sizer/sizer.dart';
import 'package:store_app/constants.dart';

class HomeSearchField extends StatelessWidget {
  const HomeSearchField({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ()=> Navigator.pushNamed(context, SearchScreen.routeName),
      child: Container(
        height: 6.h,width: 70.w,
        padding: EdgeInsets.symmetric(horizontal: 2.w),
        decoration: BoxDecoration(
            color: kSecondaryColor.withOpacity(0.2),
            borderRadius: const BorderRadius.all(Radius.circular(8))
        ),
        child: Row(
          children: [
            SvgPicture.asset("assets/icons/Search Icon.svg"),
            SizedBox(width: 2.w,),
            Text("Search for product")
          ],
        )
        // TextField(
        //   decoration: InputDecoration(
        //       border: InputBorder.none,
        //       focusedBorder: InputBorder.none,
        //       hintText: "Search for product",
        //       hintStyle: TextStyle(fontSize: 12.sp),
        //       prefixIcon: Padding(
        //         padding: const EdgeInsets.all(12),
        //         child: SvgPicture.asset("assets/icons/Search Icon.svg"),
        //       )
        //   ),
        // )
        ,
      ),
    );
  }
}