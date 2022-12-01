import 'package:flutter/material.dart';

// class Product{
//   final String img;
//   final String title;
//
//   Product({this.img, this.title});
//
//   static List<Product> products = [
//     Product(title:"Wireless Controller for PS4" ,img:"assets/images/ImgPopular1.png" ),
//     Product(title:"Nike Sport white - man pant" ,img:"assets/images/ImgPopular2.png" ),
//     Product(title:"Wireless Controller With PS4" ,img:"assets/images/ImgPopular3.png" ),
//   ];
// }

class Product{
  final List<String> img;
  final List<Color> colors;
  final String title,desc;
  final double rating, price;
  final int id;
   bool isFav, isPopular;


  Product(
      {this.img,
      this.colors,
      this.title,
      this.desc,
      this.rating = 0.0,
      this.price,
        this.id,
      this.isFav = false,
      this.isPopular = false});

  static List<Product> products = [
    Product(
      id: 1,
     title:"Wireless Controller for PS4",
     img: [
          "assets/images/ps4_console_white_1.png",
          "assets/images/ps4_console_white_2.png",
          "assets/images/ps4_console_white_3.png",
          "assets/images/ps4_console_white_4.png",
        ],
    colors: [
      Color(0xffF6625E),
      Color(0xff836DB8),
      Color(0xffEDCB9C),
      Colors.white,
    ],
    price: 63.9,
    desc: "PS4 Controller, Bluetooth PS4 Controller Wireless,"
        " PS4 Remote Controller, Replacement for Playstation 4 Controller,"
        " Compatible with Playstation 4/Slim/Pro (White)",
    isFav: true,
    isPopular: true,
    rating: 4.7),
    Product(
        id: 2,
     title:"Nike Sport white - man pant",
     img: [
          "assets/images/ImgPopular2.png",
          "assets/images/ImgPopular22.png",
        ],
    colors: [
      Color(0xffF6625E),
      Color(0xff836DB8),
      Color(0xffEDCB9C),
      Colors.white,
    ],
    price: 99.9,
    desc: "PS4 Controller, Bluetooth PS4 Controller Wireless,"
        " PS4 Remote Controller, Replacement for Playstation 4 Controller,"
        " Compatible with Playstation 4/Slim/Pro (White)",
    isFav: false,
    isPopular: true,
    rating: 4.8),
    Product(
        id: 3,
     title:"Gloves XC Omega Polygon ",
     img: [
          "assets/images/glap.png",
          "assets/images/glap1.png",
          "assets/images/glap2.png",
        ],
    colors: [
      Color(0xffF6625E),
      Color(0xff836DB8),
      Color(0xffEDCB9C),
      Colors.white,
    ],
    price: 49.9,
    desc: "PS4 Controller, Bluetooth PS4 Controller Wireless,"
        " PS4 Remote Controller, Replacement for Playstation 4 Controller,"
        " Compatible with Playstation 4/Slim/Pro (White)",
    isFav: true,
    isPopular: true,
    rating: 4.2),
    Product(
        id: 4,
     title:"wireless headset",
     img: [
          "assets/images/wireless headset.png",
        ],
    colors: [
      Color(0xffF6625E),
      Color(0xff836DB8),
      Color(0xffEDCB9C),
      Colors.white,
    ],
    price: 63,
    desc: "PS4 Controller, Bluetooth PS4 Controller Wireless,"
        "PS4 Remote Controller, Replacement for Playstation 4 Controller,"
        "Compatible with Playstation 4/Slim/Pro (White)",
    isFav: true,
    isPopular: true,
    rating: 4.2),
  ];

}