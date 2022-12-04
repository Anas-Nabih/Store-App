import 'package:flutter/cupertino.dart';
import 'package:store_app/helper/api.dart';
import 'package:store_app/helper/const.dart';
import 'package:store_app/models/product_model.dart';
import 'package:store_app/models/special_products.dart';
import 'package:store_app/services/get_products.dart';
import 'package:store_app/ui/home_screen/HomeProvider.dart';
import 'package:store_app/ui/widgets/products.dart';
import 'package:store_app/ui/widgets/home_app_bar.dart';
import 'package:store_app/ui/widgets/home_categories_list.dart';
import 'package:store_app/ui/widgets/home_head_line.dart';
import 'package:store_app/ui/widgets/popular_list.dart';
import 'package:store_app/ui/widgets/special_offer_card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

import '../widgets/dots_indecator.dart';
import '../widgets/image_slider.dart';

class HomeScreen extends StatefulWidget {
  static String routeName = "/HomeScreen";

  const HomeScreen({Key key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  HomeProvider homeProvider = HomeProvider();

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<HomeProvider>(
      create: (context) => HomeProvider(),
      child: Consumer<HomeProvider>(
        builder: (context, value, child) => Scaffold(
          body: SafeArea(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 4.w),
              child: Column(
                children: [
                  HomeAppBar(),
                  SizedBox(height: 2.h,),
                  Expanded(
                    child: ListView(
                      physics: BouncingScrollPhysics(),
                      children: [CustomImageSlider(images: homeProvider.images, provider: homeProvider),
                        DotsIndicator(dotsLength: homeProvider.images.length, provider: homeProvider),
                        SizedBox(height: 2.h,),
                        CategoriesList(),
                        SizedBox(height: 2.h,),
                        BuildHeadLine(title: "Special for you",),
                        SizedBox(
                          height: 15.h,
                          child: ListView.separated(
                            physics: BouncingScrollPhysics(),
                            scrollDirection: Axis.horizontal,
                            separatorBuilder: (context, index)=>SizedBox(width: 2.w),
                            itemCount: 2,itemBuilder: (context, index) =>
                              SpecialOfferCard(
                                img: SpecialProducts.specialList[index].img,
                                category: SpecialProducts.specialList[index].category,
                                numOfBrands: SpecialProducts.specialList[index].numOfBrands,
                              ),),
                        ),
                        SizedBox(height: 2.h,),
                        BuildHeadLine(title: "Product from api",),
                          FutureBuilder<List<ProductModel>>(
                            future: GetAllProduct.getAllProduct(),
                            builder: (context, snapshot) {
                              if (snapshot.hasData) {
                                return ProductsList(productList: snapshot.data,);
                              } else {
                                return Center(child: CircularProgressIndicator());
                              }
                            },
                          ),
                        SizedBox(height: 2.h,),
                        BuildHeadLine(title: "Popular Product",),
                        PopularList()],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}