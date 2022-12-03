import 'package:store_app/ui/cart_screen/cart_screen.dart';
import 'package:store_app/ui/home_screen/product_model.dart';
import 'package:store_app/ui/product_details/product_details_provider.dart';
import 'package:store_app/ui/widgets/build_image_preview.dart';
import 'package:store_app/ui/widgets/count_button.dart';
import 'package:store_app/ui/widgets/custom_app_bar.dart';
import 'package:store_app/ui/widgets/defult_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import 'package:store_app/constants.dart';

class ProductDetailScreen extends StatefulWidget {
  static String routeName = '/ProductDetailsScreen';

  const ProductDetailScreen({this.fromApi = false});

  final bool fromApi;

  @override
  State<ProductDetailScreen> createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  ProductDetailsProvider provider = ProductDetailsProvider();

  @override
  Widget build(BuildContext context) {

    final ProductDetailsArgument argument =
        ModalRoute.of(context).settings.arguments;

    return ChangeNotifierProvider<ProductDetailsProvider>(
      create: (context)=> provider,
      child: Consumer<ProductDetailsProvider>(
        builder: (context, value, child) => Scaffold(
          backgroundColor: Color(0xffF5F6F9),
          appBar: CustomAppBar(rating: argument.product.rating,),
          body: widget.fromApi?ListView(
            children: [
              BuildImagePreview(argument: argument,provider: provider,),
              Container(
                margin: EdgeInsets.only(top:4.h),
                width: double.infinity,/*height: 50.h,*/
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(30),
                      topLeft: Radius.circular(30),
                    )
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 15),
                      child: Text(argument.product.title,style: TextStyle(
                          color: Colors.black,fontSize: 16.sp
                      ),),
                    ),
                    Align(alignment: Alignment.topRight,
                      child: Container(
                        padding: EdgeInsets.all(8),
                        height: 6.h,width: 15.w,
                        decoration: BoxDecoration(
                            color: kPrimaryColor.withOpacity(0.15),
                            borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(25),
                              topLeft: Radius.circular(25),
                            )
                        ),
                        child: GestureDetector(
                          onTap: (){
                            setState((){
                              argument.product.isFav = !argument.product.isFav;
                            });
                          },
                          child: SvgPicture.asset("assets/icons/Heart Icon_2.svg",
                            color: argument.product.isFav == true?
                            Color(0xffFF4848) : Color(0xffDBDEE4),),
                        ),
                      ),),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 15),
                      child: Text(argument.product.desc,style: TextStyle(fontSize: 12.sp
                      )),
                    ),
                  ],
                ),
              ),
              Container(
                width: double.infinity,
                padding: EdgeInsets.symmetric(vertical: 1.h,horizontal: 2.w),
                decoration: BoxDecoration(
                    color: kSecondaryColor.withOpacity(0.3),
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(30),
                      topLeft: Radius.circular(30),
                      bottomLeft: Radius.circular(30),
                      bottomRight: Radius.circular(30),

                    )
                ),
                child: Row(
                  children: [
                    ...List.generate(argument.product.colors.length,
                            (index) => GestureDetector(
                          onTap: ()=> provider.selectedColor = index,
                          child: Container(
                            height: 8.h,width: 10.w,
                            decoration: BoxDecoration(
                                border: Border.all(color:provider.selectedColor == index?
                                kPrimaryColor:Colors.transparent),
                                shape: BoxShape.circle
                            ),
                            child: Center(
                              child: Container(
                                margin: EdgeInsets.only(left:1.w,right: 1.w),
                                height: 5.h,width: 7.w,
                                decoration: BoxDecoration(
                                  color: argument.product.colors[index],
                                  shape: BoxShape.circle,
                                ),
                              ),
                            ),
                          ),
                        )),
                    Spacer(),
                    CountButton(iconData:Icons.remove,provider: provider,
                      onPressed: () {
                        if(provider.qty >1) {
                          provider.decreaseQTY();
                        }
                      },),
                    SizedBox(width: 3.w,),
                    Text("${provider.qty}",style: TextStyle(
                        color: Colors.black,fontSize: 12.sp
                    ),),
                    SizedBox(width: 3.w,),
                    CountButton(iconData:Icons.add,provider: provider,
                      onPressed: ()=>provider.increaseQTY(),),
                  ],
                ),
              ),
              Container(
                width: double.infinity,
                padding: EdgeInsets.symmetric(vertical: 5.h,horizontal: 2.w),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(30),
                      topLeft: Radius.circular(30),
                    )
                ),
                child: DefaultButton(text: "Add To Cart",onPressed: ()=>
                    Navigator.pushNamed(context, CartScreen.routeName,arguments: CartScreenArgument(qty: provider.qty,product: argument.product))
                  ,),
              ),
            ],
          ) :ListView(
            children: [
              BuildImagePreview(argument: argument,provider: provider,),
              Container(
                margin: EdgeInsets.only(top:4.h),
                width: double.infinity,/*height: 50.h,*/
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(30),
                    topLeft: Radius.circular(30),
                  )
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 15),
                      child: Text(argument.product.title,style: TextStyle(
                        color: Colors.black,fontSize: 16.sp
                      ),),
                    ),
                    Align(alignment: Alignment.topRight,
                      child: Container(
                        padding: EdgeInsets.all(8),
                      height: 6.h,width: 15.w,
                      decoration: BoxDecoration(
                          color: kPrimaryColor.withOpacity(0.15),
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(25),
                          topLeft: Radius.circular(25),
                        )
                      ),
                        child: GestureDetector(
                          onTap: (){
                            setState((){
                              argument.product.isFav = !argument.product.isFav;
                            });
                          },
                          child: SvgPicture.asset("assets/icons/Heart Icon_2.svg",
                          color: argument.product.isFav == true?
                          Color(0xffFF4848) : Color(0xffDBDEE4),),
                        ),
                    ),),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 15),
                      child: Text(argument.product.desc,style: TextStyle(fontSize: 12.sp
                      )),
                    ),
                  ],
                ),
              ),
              Container(
                width: double.infinity,
                padding: EdgeInsets.symmetric(vertical: 1.h,horizontal: 2.w),
                decoration: BoxDecoration(
                    color: kSecondaryColor.withOpacity(0.3),
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(30),
                      topLeft: Radius.circular(30),
                      bottomLeft: Radius.circular(30),
                      bottomRight: Radius.circular(30),

                    )
                ),
                child: Row(
                  children: [
                    ...List.generate(argument.product.colors.length,
                            (index) => GestureDetector(
                          onTap: ()=> provider.selectedColor = index,
                          child: Container(
                            height: 8.h,width: 10.w,
                            decoration: BoxDecoration(
                                border: Border.all(color:provider.selectedColor == index?
                                kPrimaryColor:Colors.transparent),
                                shape: BoxShape.circle
                            ),
                            child: Center(
                              child: Container(
                                margin: EdgeInsets.only(left:1.w,right: 1.w),
                                height: 5.h,width: 7.w,
                                decoration: BoxDecoration(
                                  color: argument.product.colors[index],
                                  shape: BoxShape.circle,
                                ),
                              ),
                            ),
                          ),
                        )),
                    Spacer(),
                    CountButton(iconData:Icons.remove,provider: provider,
                      onPressed: () {
                        if(provider.qty >1) {
                          provider.decreaseQTY();
                        }
                      },),
                    SizedBox(width: 3.w,),
                    Text("${provider.qty}",style: TextStyle(
                      color: Colors.black,fontSize: 12.sp
                    ),),
                    SizedBox(width: 3.w,),
                    CountButton(iconData:Icons.add,provider: provider,
                      onPressed: ()=>provider.increaseQTY(),),
                  ],
                ),
              ),
              Container(
                width: double.infinity,
                padding: EdgeInsets.symmetric(vertical: 5.h,horizontal: 2.w),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(30),
                      topLeft: Radius.circular(30),
                    )
                ),
                child: DefaultButton(text: "Add To Cart",onPressed: ()=>
                    Navigator.pushNamed(context, CartScreen.routeName,arguments: CartScreenArgument(qty: provider.qty,product: argument.product))
                  ,),
              ),
            ],
          ),
        ),
      ),
    );
  }
}






class ProductDetailsArgument{
  final Product product;
  ProductDetailsArgument({this.product});
}
