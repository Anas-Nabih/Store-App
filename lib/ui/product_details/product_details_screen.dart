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
import 'package:store_app/ui/widgets/fav_button.dart';
import 'package:store_app/ui/widgets/product_desc.dart';
import 'package:store_app/ui/widgets/product_title.dart';
import 'package:store_app/ui/widgets/quantity_color_bar.dart';

class ProductDetailScreen extends StatefulWidget {
  static String routeName = '/ProductDetailsScreen';

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
      create: (context) => provider,
      child: Consumer<ProductDetailsProvider>(
        builder: (context, value, child) => Scaffold(
            backgroundColor: Color(0xffF5F6F9),
            appBar: CustomAppBar(
              rating: argument.product.rating,
            ),
            body: Column(
              children: [
                BuildImagePreview(argument: argument, provider: provider,),
                Expanded(
                  child: Container(
                    padding: EdgeInsets.only(top: 2.h,),
                    margin: EdgeInsets.only(top: 4.h,),
                    width: double.infinity,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(30),
                          topLeft: Radius.circular(30),
                        )),
                    child: ListView(
                      shrinkWrap: true,
                      physics: BouncingScrollPhysics(),
                      children: [
                        ProductTitle(productTitle: argument.product.title),
                        FavButton(argument: argument),
                        ProductDesc(desc: argument.product.desc),
                        QuantityColorBar(argument: argument, provider: provider),
                        SizedBox(height: 3.h),
                        DefaultButton(
                          text: "Add To Cart",
                          onPressed: () => Navigator.pushNamed(
                              context, CartScreen.routeName,
                              arguments: CartScreenArgument(
                                  qty: provider.qty,
                                  product: argument.product)),
                        ),
                        SizedBox(height: 3.h),
                      ],
                    ),
                  ),
                ),
              ],
            )),
      ),
    );
  }
}




class ProductDetailsArgument {
  final Product product;

  ProductDetailsArgument({this.product});
}
