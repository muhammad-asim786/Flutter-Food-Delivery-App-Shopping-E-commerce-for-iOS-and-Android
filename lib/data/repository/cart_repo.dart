import 'dart:convert';

import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../models/cart_model.dart';
import '../../utils/app_constant.dart';

class CartRepo {
  final SharedPreferences sharedPreferences;

  CartRepo({
    required this.sharedPreferences,
  });

  List<String> cart = [];
  List<String> cartHistory = [];

  void addToCartList(List<CartModels> cartList) {
    //sharedPreferences.remove(AppConstants.CART_LIST);
    //sharedPreferences.remove(AppConstants.CART_HISTORY_LIST);

    var time =DateTime.now().toString();
    cart = [];
    /*
    * convert objests to string because SharedPreferences only accept String
    * */

    cartList.forEach((element) {
      element.time = "";
      cart.add(jsonEncode(element));
    });

    sharedPreferences.setStringList(AppConstants.CART_LIST, cart);
    //print(sharedPreferences.getStringList(AppConstants.CART_LIST));
    //getCartList();
  }

/*
* its for storage the data when you close your apps*/
  List<CartModels> getCartList() {
    List<String> carts = [];
    if (sharedPreferences.containsKey(AppConstants.CART_LIST)) {
      carts = sharedPreferences.getStringList(AppConstants.CART_LIST)!;
      print('inside getCartList' + carts.toString());
    }
    List<CartModels> cartList = [];

    carts.forEach(
        (element) => cartList.add(CartModels.fromJson(jsonDecode(element))));

    return cartList;
  }

  List<CartModels> getCartHistoryList() {
    if (sharedPreferences.containsKey(AppConstants.CART_HISTORY_LIST)) {
      //cartHistory = [];
      cartHistory =
          sharedPreferences.getStringList(AppConstants.CART_HISTORY_LIST)!;
    }
    List<CartModels> cartListHistory = [];
    cartHistory.forEach((element) =>
        cartListHistory.add(CartModels.fromJson(jsonDecode(element))));
    return cartListHistory;
  }

  void addToCartHistoryList() {
    if (sharedPreferences.containsKey(AppConstants.CART_HISTORY_LIST)) {
      cartHistory =
          sharedPreferences.getStringList(AppConstants.CART_HISTORY_LIST)!;
    }
    for (int i = 0; i < cart.length; i++) {
      print('history list ' + cart[i]);
      cartHistory.add(cart[i]);
    }
    removeCart();
    sharedPreferences.setStringList(
        AppConstants.CART_HISTORY_LIST, cartHistory);
    print('The lenght of history list is ' +
        getCartHistoryList().length.toString());
   for(int i=0; i <getCartHistoryList().length;i++){
     print("the time for the order "+getCartHistoryList()[i].time.toString());
   }
  }

  void removeCart() {
    cart = [];
    sharedPreferences.remove(AppConstants.CART_LIST);
  }
}
