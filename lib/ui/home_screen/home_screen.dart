import 'package:store_app/ui/home_screen/HomeProvider.dart';
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
            child: SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.only(left: 1.w, top: 2.h, bottom: 2.h),
                child: ConstrainedBox(
                  constraints: BoxConstraints(
                      maxHeight: MediaQuery.of(context).size.height),
                  child: Column(
                    children: [
                      HomeAppBar(),
                      SizedBox(
                        height: 2.h,
                      ),
                      CustomImageSlider(
                          images: homeProvider.images, provider: homeProvider),
                      DotsIndicator(
                          dotsLength: homeProvider.images.length,
                          provider: homeProvider),
                      // DiscountBanner(),
                      SizedBox(
                        height: 2.h,
                      ),
                      CategoriesList(),
                      SizedBox(
                        height: 2.h,
                      ),
                      BuildHeadLine(
                        title: "Special for you",
                      ),
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: [
                            SizedBox(
                              width: 2.w,
                            ),
                            SpecialOfferCard(
                              img: "assets/images/imgBanner1.png",
                              category: "Smartphone",
                              numOfBrands: 18,
                            ),
                            SizedBox(
                              width: 3.w,
                            ),
                            SpecialOfferCard(
                              img: "assets/images/imgBanner2.png",
                              category: "Fashion",
                              numOfBrands: 24,
                            ),
                            SizedBox(
                              width: 2.w,
                            ),
                          ],
                        ),
                      ),
                      BuildHeadLine(
                        title: "Popular Product",
                      ),
                      PopularList()
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
