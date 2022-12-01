import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:store_app/constants.dart';

class BuildSpecialList extends StatelessWidget {
  BuildSpecialList({
    Key key,
  }) : super(key: key);
  List<String> images = [
    "assets/images/imgBanner1.png",
    "assets/images/imgBanner2.png",
  ];

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: images.length,
        itemBuilder: (context, index) => SpecialItem(img: images[index],),),
    );
  }
}

class SpecialItem extends StatelessWidget {
  final String img;
  SpecialItem({
    Key key, this.img,
  });



  @override
  Widget build(BuildContext context) {
    return Container(
      height: 16.h,width: 44.w,
      margin: EdgeInsets.symmetric(vertical: 1.h,horizontal: 1.w),
      decoration: BoxDecoration(
          color: kSecondaryColor.withOpacity(.2),
          borderRadius: const BorderRadius.all(Radius.circular(12)),
          image: DecorationImage(
              image: AssetImage(img),
              fit: BoxFit.cover
          )
      ),
    );
  }
}