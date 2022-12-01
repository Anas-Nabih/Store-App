import 'dart:convert';

import 'package:store_app/ui/widgets/cart_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sizer/sizer.dart';
import 'package:store_app/constants.dart';
import '../home_screen/product_model.dart';
import 'cart_model.dart';

class CartScreen extends StatefulWidget {

  static String routeName = "/CartScreen";


  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {


  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    final CartScreenArgument argument =
        ModalRoute.of(context).settings.arguments;

    return Scaffold(
      appBar: buildCartAppBar(items: Cart.cartList.length,context: context),
      body: /*argument.isHome ? Center(child: Text("Add Some products")):*/Container(
        padding: EdgeInsets.symmetric(horizontal: 3.w,vertical: 2.h),
        child: ListView.builder(
          itemCount: Cart.cartList.length,
          itemBuilder: (context, index) => Dismissible(
            key: Key(Cart.cartList[index].product.id.toString()),
            child: cartItem(argument:argument,demoCart: Cart.cartList[index]),
            background: Container(
              padding: EdgeInsets.symmetric(horizontal: 5.w),
              decoration: BoxDecoration(
                  color: Color(0xffFFE6E6),
                  borderRadius: const BorderRadius.all(Radius.circular(12))
              ),
              child: Row(
                children: [
                  Spacer(),
                  SvgPicture.asset("assets/icons/Trash.svg"),
                ],
              ),
            ),
            direction: DismissDirection.endToStart,
            onDismissed: (direction){
              setState(() {
                Cart.cartList.removeAt(index);
              });
            },
          ),
        ),
      ),
      bottomNavigationBar: Container(
        width: double.infinity,
        height: 20.h,
        padding: EdgeInsets.symmetric(horizontal: 3.w,vertical: 3.h),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius:BorderRadius.only(
              topRight: Radius.circular(20),
              topLeft: Radius.circular(20),
            ),
            boxShadow: [
              BoxShadow(
                  color: kSecondaryColor.withOpacity(0.3),
                  blurRadius: 10,offset: Offset(0,3),spreadRadius: 3)
            ]
        ),
        child: Column(
          children: [
            Row(
              children: [
                Container(
                  width: 10.w,height: 6.h,
                  padding: const EdgeInsets.all(11),
                  decoration: BoxDecoration(
                    color: kSecondaryColor.withOpacity(0.15),
                    borderRadius:BorderRadius.circular(12),
                  ),
                  child: SvgPicture.asset("assets/icons/receipt.svg"),
                ),
                Spacer(),
                Text("Add Voucher Code"),
                SizedBox(width: 1.w,),
                SvgPicture.asset("assets/icons/arrow_right.svg",height: 1.5.h,)
              ],
            ),
            SizedBox(height: 2.h,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Total:",style: TextStyle(
                        fontSize: 12.sp
                    ),),
                    // Text("\$${argument.product.price * argument.qty}",style: TextStyle(
                    //     fontSize: 12.sp,fontWeight: FontWeight.w600
                    // ),),
                  ],
                ),
                GestureDetector(
                  onTap: (){},
                  child: Container(
                    width: 30.w, height: 6.h,
                    decoration: BoxDecoration(
                        color: kPrimaryColor,
                        borderRadius: const BorderRadius.all(Radius.circular(12))
                    ),
                    child: Center(child: Text("Checkout",style: TextStyle(color: Colors.white,fontSize: 14.sp),),),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }


  Row cartItem({CartScreenArgument argument, Cart demoCart}) {
    return Row(
            children: [
              Container(
                padding: const EdgeInsets.all(12),
                margin: const EdgeInsets.all(12),
                height: 15.h,width: 25.w,
                decoration: BoxDecoration(
                  color: kSecondaryColor.withOpacity(0.15),
                  borderRadius: const BorderRadius.all(Radius.circular(12))
                ),
                child: Image.asset(demoCart.product.img[0]),
              ),
              SizedBox(
                width: 5.w,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(demoCart.product.title,style: TextStyle(
                    color: Colors.black,fontSize: 14.sp
                  ),),
                  Text.rich(TextSpan(
                    children: [
                      TextSpan(text: "\$${demoCart.product.price}",style: TextStyle(
                          color: kPrimaryColor,fontSize: 12.sp
                      )),
                      TextSpan(text: "  x ",style: TextStyle(
                          color: kSecondaryColor,fontSize: 10.sp
                      )),
                      TextSpan(text: "Nz"/*${argument.qty}*/,style: TextStyle(
                          color: kSecondaryColor,fontSize: 12.sp
                      )),
                    ]
                  )),
              ],)
            ],
          );
  }
}


class CartScreenArgument{
  final Product product;
  final int qty;
  final bool isHome;

  CartScreenArgument({this.product, this.qty,this.isHome=false});
}
