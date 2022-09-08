import 'package:delivery_app/controllers/cart_controller.dart';
import 'package:delivery_app/models/popular_products_,odels.dart';
import 'package:delivery_app/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../data/repository/popular_product_repo.dart';
import '../models/cart_model.dart';


class PopularProductController extends GetxController {
  final PopularProductRepo popularProductRepo;

  PopularProductController({required this.popularProductRepo});
  List<dynamic> _popularProductList = [];
  List<dynamic> get popularProductList => _popularProductList;
  late CartController _cart;

  bool _isLoaded = false;
  bool get isLoaded => _isLoaded;

  int _quantity = 0;
  int get quantity => _quantity;
  int _inCartItem = 0;
  int get inCartItem => _inCartItem+_quantity;

  Future<void> getPopularProductList() async {
    // print('object');
    Response response = await popularProductRepo.getPopularProductList();
    if (response.statusCode == 200) {
      _popularProductList = [];
      _popularProductList.addAll(Product.fromJson(response.body).products);
      _isLoaded = true;
      update();
    } else {
    }
  }
  void setQuantity (bool quantity){
    if(quantity){
      _quantity = checkQuantity(_quantity+1);
      print('this is adding '+_quantity.toString());
     }else{
       _quantity = checkQuantity(_quantity-1);
    }
    update();
  }
  int checkQuantity(int quantity){
    if((_inCartItem+quantity)<0){
      Get.snackbar('Item count',"you can't reduce more !",
      backgroundColor: AppColor.mainColor,
        colorText: Colors.white,
      );
      if(_inCartItem>0){
         _quantity=  - _inCartItem;
         return _quantity;
      }
      return 0;
    }else if(_inCartItem+quantity>20){
      Get.snackbar('Item count',"you can't add more !",
        backgroundColor: AppColor.mainColor,
        colorText: Colors.white,
      );
      return 20;
    }else{
      return quantity;
    }
  }
  void getinit(ProductsModels products, CartController cart){
    _quantity = 0;
    _inCartItem = 0;
    _cart=cart;
    var exist = false;
    exist= _cart.existInCart(products);
   // print('exist or not '+exist.toString());
    if(exist){
      _inCartItem= _cart.getQuantity(products);
    }
   // print('the quantity in the cart s '+ _inCartItem.toString());
  }
  void addItem(ProductsModels product){
     // if(quantity>0){
       _cart.addItem(product, _quantity);
       _quantity=0;
       _inCartItem=_cart.getQuantity(product);


       _cart.item.forEach((key, value) {
         // print('the id is '+value.id.toString()+" the quantity is"+value.quantity.toString());
       }) ;
       update();
  }

  int get totalItem{
    return _cart.totalItem;
  }
   List<CartModels> get getItems{
    return _cart.getItem;

   }
}
