import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sizer/sizer.dart';
import 'package:store_app/constants.dart';
import 'package:store_app/ui/product_details/product_details_screen.dart';


class FavButton extends StatefulWidget {
  const FavButton({@required this.argument});

  final ProductDetailsArgument argument;

  @override
  State<FavButton> createState() => _FavButtonState();
}

class _FavButtonState extends State<FavButton> {
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topRight,
      child: Container(
        padding: EdgeInsets.all(8),
        height: 6.h,
        width: 15.w,
        decoration: BoxDecoration(
            color: kPrimaryColor.withOpacity(0.15),
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(25),
              topLeft: Radius.circular(25),
            )),
        child: GestureDetector(
          onTap: () {
            setState(() {
              widget.argument.product.isFav =
              !widget.argument.product.isFav;
            });
          },
          child: SvgPicture.asset(
            "assets/icons/Heart Icon_2.svg",
            color:widget. argument.product.isFav == true
                ? Color(0xffFF4848)
                : Color(0xffDBDEE4),
          ),
        ),
      ),
    );
  }
}