import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';
import 'package:photo_view/photo_view_gallery.dart';
import 'package:sizer/sizer.dart';

class ImagesGallery extends StatefulWidget {
  final List images;
  PageController pageController;
  int index;
  ImagesGallery({this.images,this.index=0}) : pageController = PageController(initialPage: index), pageIndex = index;

  int pageIndex;

  @override
  State<ImagesGallery> createState() => _ImagesGalleryState();
}

class _ImagesGalleryState extends State<ImagesGallery> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.bottomLeft,
        children: [
          PhotoViewGallery.builder(
            pageController: widget.pageController,
              onPageChanged: (index){
              setState(() {
                widget.pageIndex = index;
              });
              },
              itemCount: widget.images.length, builder: (context, index) =>
              PhotoViewGalleryPageOptions(
                minScale: PhotoViewComputedScale.contained,
                  imageProvider: AssetImage(widget.images[index]),
              ),),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 2.w),
            child: Text("Images ${widget.pageIndex + 1}/${widget.images.length}",style: TextStyle(
              color: Colors.white
            ),),
          )
        ],
      ),
    );
  }
}
