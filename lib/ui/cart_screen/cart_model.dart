
import 'package:store_app/ui/home_screen/product_model.dart';

class Cart{
  final Product product;
  final int unmOfItems;

  Cart({this.product, this.unmOfItems});

 static  List<Cart> cartList = [
    Cart(product:Product.products[0],unmOfItems: 1),
    Cart(product:Product.products[1],unmOfItems: 2),
    Cart(product:Product.products[2],unmOfItems: 3),
    Cart(product:Product.products[3],unmOfItems: 4),
  ];
}