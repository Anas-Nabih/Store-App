import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CustomAppBar extends PreferredSize {
  final double rating;
  CustomAppBar({this.rating});

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(AppBar().preferredSize.height);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0) ,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            RoundedIconButton(
              onPressed: ()=>Navigator.pop(context),
              iconData:Icons.arrow_back_ios_rounded ,),
            Container(
              padding: const EdgeInsets.symmetric(horizontal:8,vertical: 5),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12)
              ),
              child: Row(
                children: [
                  Text("${rating}",style:TextStyle(
                      color: Colors.black
                  ),),
                  SizedBox(width: 5,),
                  SvgPicture.asset("assets/icons/Star Icon.svg")
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class RoundedIconButton extends StatelessWidget {
  final IconData iconData;
  final Function onPressed;
  RoundedIconButton({
    this.iconData,this.onPressed
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap:onPressed,
      borderRadius: BorderRadius.circular(20),
      child: Container(
          height: 40,width: 40,
          decoration: BoxDecoration(
            color: Colors.white,
            shape: BoxShape.circle,
          ),
          child: Icon(iconData, color: Colors.black,)

      ),
    );
  }
}