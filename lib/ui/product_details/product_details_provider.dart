import 'package:flutter/cupertino.dart';


class ProductDetailsProvider extends ChangeNotifier{

  int _slectedIndex = 0;

  int get slectedIndex => _slectedIndex;

  set slectedIndex(int value) {
    _slectedIndex = value;
    notifyListeners();
  }

  int _selectedColor =0;

  int get selectedColor => _selectedColor;

  set selectedColor(int value) {
    _selectedColor = value;
    notifyListeners();
  }

  int _qty = 1;

  int get qty => _qty;

  set qty(int value) {
    _qty = value;
    notifyListeners();
  }

  increaseQTY(){
    qty ++;
    notifyListeners();
  }
  decreaseQTY(){
    qty --;
    notifyListeners();
  }
}