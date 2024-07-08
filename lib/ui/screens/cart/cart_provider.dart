
import 'package:flutter/material.dart';
import 'package:timbu_shop/model/product_item.dart';

import '../../../model/cart_item.dart';

class CartProvider with ChangeNotifier{
  List<CartItem> cartItems = [];

  void addToCart(ProductItem item){
    String digit = item.pricing.substring(1);
    double myPrice = int.parse(digit).toDouble();
     CartItem myCartItem = CartItem(name: item.title,
         image: item.images[1], price: myPrice, quantity: 1);
    cartItems.add(myCartItem);
    notifyListeners();
  }
}