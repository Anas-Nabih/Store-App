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
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        HomeSearchField(),
        NotificationIcon(img:"assets/icons/Cart Icon.svg",num: 0,
          onPress: ()=>Navigator.pushNamed(context, CartScreen.routeName,arguments: CartScreenArgument(isHome: true)),),
        NotificationIcon(img:"assets/icons/Bell.svg",num: 3,),
        SizedBox(width: 1.w,)
      ],
    );
  }
}