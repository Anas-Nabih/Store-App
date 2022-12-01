import 'package:store_app/ui/product_details/product_details_provider.dart';
import 'package:store_app/ui/product_details/product_details_screen.dart';
import 'package:store_app/ui/widgets/images_gallery.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../constants.dart';


class BuildImagePreview extends StatelessWidget {
  const BuildImagePreview({
    Key key,
    @required this.argument,
    this.provider
  }) : super(key: key);

  final ProductDetailsArgument argument;
  final ProductDetailsProvider provider;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: ()=> openGallery(
              context:context,images:argument.product.img,index: provider.slectedIndex ),
          child: Container(
              width:double.infinity,height: 35.h,
              padding: EdgeInsets.all(30),
              child: Image.asset(
                argument.product.img[provider.slectedIndex],)
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ...List.generate(
              argument.product.img.length,
                  (index) => BuildSmallPreview(
                provider: provider,argument: argument,index: index,),)
          ],
        ),
      ],
    );
  }

  BuildSmallPreview({
    final int index,
    final ProductDetailsArgument argument,
    final ProductDetailsProvider provider,
  }){
    return GestureDetector(
      onTap: () => provider.slectedIndex = index,
      child: Container(
        height: 7.h,width: 12.w,
        margin: const EdgeInsets.symmetric(horizontal: 5),
        padding: const EdgeInsets.all(5),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
                color:provider.slectedIndex == index ?
                kPrimaryColor : Colors.transparent)
        ),
        child: Image.asset(argument.product.img[index]),
      ),
    );
  }

  openGallery({BuildContext context, List<String> images, int index})=>
      Navigator.push(context, MaterialPageRoute(builder: (context) => ImagesGallery(images: images,index: index,),));
}