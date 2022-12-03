
import 'package:carousel_slider/carousel_slider.dart';
import 'package:store_app/ui/home_screen/HomeProvider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';



class CustomImageSlider extends StatefulWidget {
  const CustomImageSlider({
    this.onChanged,
    this.infiniteScroll,
    this.type,
    this.images,
    this.provider
  });

  @override
  _CustomImageSliderState createState() => _CustomImageSliderState();
  final String type;


  final bool infiniteScroll;
  final List<String> images;
  final HomeProvider provider;
  final Function(int index, CarouselPageChangedReason reason) onChanged;
}

class _CustomImageSliderState extends State<CustomImageSlider> {

  @override
  Widget build(BuildContext context) {
    return Container(
      child: CarouselSlider(
          items: List.generate(
              widget.images.length,
                  (index) => Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Stack(
                  children: [
                    // Places image
                    ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: Image.asset(widget.images[index]),
                    ),
                    // overlay color
                    Container(
                      height: 40.h,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          gradient: LinearGradient(
                              begin: FractionalOffset.center,
                              end: FractionalOffset.bottomCenter,
                              colors: [
                                Colors.transparent,
                                Colors.black26,
                              ],
                              stops: [
                                0.0,
                                1.0
                              ])),
                    ),
                    // back image
                    // Positioned(
                    //     bottom: 2.1.h,
                    //     left: 5.w,
                    //     child: Container(
                    //       height: 8.h,
                    //       width: 24.w,
                    //       decoration: BoxDecoration(
                    //         // Custom Container over Entertainment images
                    //         image: DecorationImage(
                    //             fit: BoxFit.cover,
                    //             image: AssetImage(
                    //                 "assets/images/png/Path5.png")),
                    //       ),
                    //     )),
                    // //front image
                    // Positioned(
                    //     bottom: 0.h,
                    //     left: 0,
                    //     child: ClipRRect(
                    //       borderRadius: BorderRadius.only(
                    //           bottomLeft: Radius.circular(12)),
                    //       child: Container(
                    //         height: 8.h,
                    //         width: 24.w,
                    //         decoration: BoxDecoration(
                    //           // Custom Container over Entertainment images
                    //           image: DecorationImage(
                    //               fit: BoxFit.cover,
                    //               image: AssetImage(
                    //                   "assets/images/png/Path2.png")),
                    //         ),
                    //       ),
                    //     )),
                    // iconBack
                    Positioned(
                        bottom: 1.5.h,
                        left: 2.5.h,
                        child: Container(
                          height: 4.5.h,
                          width: 10.w,
                          decoration: BoxDecoration(
                              color: Color(0xffca7d94),
                              borderRadius: BorderRadius.circular(12.0)),
                          child: Directionality(
                            textDirection: TextDirection.ltr,
                            child: IconButton(
                              onPressed: () {
                              },
                              iconSize: 4.w,
                              icon: Icon(Icons.arrow_forward_ios),
                              color: Colors.white,
                            ),
                          ),
                        )),
                    // Text
                    Positioned(
                        bottom: 1.5.h,
                        right: 3.h,
                        child: Container(
                          // height: 4.5.h,
                          width: 50.w,
                          child: Center(
                              child: Text(
                                "Offers Part",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.bold,
                                ),
                                textAlign: TextAlign.left,
                                textDirection: TextDirection.ltr,
                              )),
                        )),
                  ],
                ),
              )),
          options: CarouselOptions(
            aspectRatio: 16 / 9,
            height: 20.h,
            scrollPhysics: BouncingScrollPhysics(),
            viewportFraction: 0.9,
            initialPage: 0,
            enableInfiniteScroll: widget.infiniteScroll ?? true,
            reverse: false,
            autoPlay: true,
            autoPlayInterval: Duration(seconds: 10),
            autoPlayAnimationDuration: Duration(milliseconds: 200),
            autoPlayCurve: Curves.bounceInOut,
            enlargeCenterPage: true,
            onPageChanged: /*widget.onChanged ??*/ (i, r) {
              widget.provider.animatedIndex = i;
              setState(() {

              });
              },
            scrollDirection: Axis.horizontal,
          )),
    );
  }
}
