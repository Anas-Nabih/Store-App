import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sizer/sizer.dart';
import '../../constants.dart';


class CategoriesList extends StatelessWidget {
  CategoriesList({Key key}) : super(key: key);

  List<Map<String, dynamic>> categories = [
    {"icon": "assets/icons/Flash Icon.svg", "title": "Falsh Deal"},
    {"icon": "assets/icons/Bill Icon.svg", "title": "Bill"},
    {"icon": "assets/icons/Game Icon.svg", "title": "Game"},
    {"icon": "assets/icons/Gift Icon.svg","title": "Daily Gift"},
    {"icon": "assets/icons/Phone.svg", "title": "More"},
  ];
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          ...List.generate(categories.length, (index) =>
              CategoryItem(title: categories[index]["title"],icon: categories[index]["icon"], ))
        ],
      ),
    );
  }
}

class CategoryItem extends StatelessWidget {
  final String icon;
  final String title;
  CategoryItem({this.icon,this.title});
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 20.w,
      child: Column(
        children: [
          AspectRatio(
            aspectRatio: 3/2,
            child: Container(
              width: 15.w,height: 8.h,
              margin: EdgeInsets.symmetric(horizontal: 2.w),
              decoration: BoxDecoration(
                  color: kLightPrimaryColor,
                  borderRadius:const BorderRadius.all(Radius.circular(12))
              ),child: Padding(
                padding: EdgeInsets.all(2.5.w),
                child: SvgPicture.asset(icon,color: kPrimaryColor,)),
            ),
          ),
          SizedBox(height: 1.h),
          Text(title)
        ],
      ),
    );
  }
}