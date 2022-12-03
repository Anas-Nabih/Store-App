import 'package:store_app/ui/cart_screen/cart_screen.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'home_search_field.dart';
import 'notifiaction_icon.dart';

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 1.h,),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          HomeSearchField(),
          SizedBox(width: 2.w,),
          NotificationIcon(img:"assets/icons/Cart Icon.svg",num: 0,
            onPress: ()=>Navigator.pushNamed(context, CartScreen.routeName,arguments: CartScreenArgument(isHome: true)),),
          SizedBox(width: 1.w,),
          NotificationIcon(img:"assets/icons/Bell.svg",num: 3,),
        ],
      ),
    );
  }
}