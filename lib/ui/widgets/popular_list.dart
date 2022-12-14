import 'package:store_app/ui/home_screen/product_model.dart';
import 'package:store_app/ui/product_details/product_details_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sizer/sizer.dart';

import '../../constants.dart';


class PopularList extends StatelessWidget {
  const PopularList({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 38.h,
      child: ListView.builder(
        physics: BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemCount: Product.products.length,
        itemBuilder: (context, index) => CustomCard(index: index),),
    );
  }
}




class CustomCard extends StatefulWidget {

  CustomCard({
    this.index
  });
  int index;

  @override
  State<CustomCard> createState() => _CustomCardState();
}

class _CustomCardState extends State<CustomCard> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        GestureDetector(
          onTap:()=> Navigator.pushNamed(
              context, ProductDetailScreen.routeName,
              arguments: ProductDetailsArgument(product:Product.products[widget.index])),
          child: Container(
            height: 24.h,width: 38.w,
            margin: EdgeInsets.only(bottom: 1.h,right: 2.w,left: 2.w),
            decoration: BoxDecoration(
                color: kSecondaryColor.withOpacity(0.1),
                borderRadius: const BorderRadius.all(Radius.circular(12))
            ),
            child: Padding(
              padding: EdgeInsets.all(3.w),
              child: Image.asset(Product.products[widget.index].img[0]),
            ),
          ),
        ),
        Container(
          width: 38.w,
          height: 4.5.h,
          padding: EdgeInsets.symmetric(horizontal: 3.w),
          child: Text(Product.products[widget.index].title,
            // maxLines: 2,
            textAlign: TextAlign.start,
            // overflow: TextOverflow.ellipsis,
            style: TextStyle(fontSize: 9.sp),),
        ),
        Padding(
          padding:EdgeInsets.symmetric(horizontal: 3.w),
          child: Row(
            children: [
              Text("\$${Product.products[widget.index].price}",style: TextStyle(
                  color: kPrimaryColor,fontWeight: FontWeight.w500,fontSize: 13.sp
              ),),
              SizedBox(width: 15.w,),
              InkWell(
                onTap: (){
                  setState((){
                    Product.products[widget.index].isFav = !Product.products[widget.index].isFav;
                  });
                },
                borderRadius: BorderRadius.circular(50),
                child: Container(
                  width: 7.w,height: 4.h,
                  padding: const EdgeInsets.all(7),
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color:  Product.products[widget.index].isFav == true ?
                      kPrimaryColor.withOpacity(0.15)
                          :kSecondaryColor.withOpacity(0.1)
                  ),
                  child: SvgPicture.asset("assets/icons/Heart Icon_2.svg",
                    color: Product.products[widget.index].isFav == true ?
                    Color(0xffFF4848) : Color(0xffDBDEE4),),
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
