import 'package:flutter/cupertino.dart';

class HomeProvider extends ChangeNotifier{
  List<String> images = [
    "assets/images/imgBanner2.png",
    "assets/images/imgBanner2.png",
    "assets/images/imgBanner2.png",
  ] ;

  int _animatedIndex = 0;

  int get animatedIndex => _animatedIndex;

  set animatedIndex(int value) {
    _animatedIndex = value;
    notifyListeners();
  }
}