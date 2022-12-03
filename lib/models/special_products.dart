import 'package:flutter/cupertino.dart';

class SpecialProducts{
  final String img;
  final String category;
  final int numOfBrands;

  SpecialProducts({@required this.img,@required this.category,@required this.numOfBrands});

static List<SpecialProducts> specialList = [
  SpecialProducts(
    category: "Smartphone",
    img:"assets/images/imgBanner1.png" ,
    numOfBrands: 18
  ),SpecialProducts(
    category: "Fashion",
    img:"assets/images/imgBanner2.png",
    numOfBrands: 24
  ),

];

}