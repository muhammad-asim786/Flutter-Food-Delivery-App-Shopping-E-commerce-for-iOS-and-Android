import 'package:delivery_app/models/popular_products_,odels.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../data/repository/cart_repo.dart';
import '../models/cart_model.dart';
import '../utils/colors.dart';

class CartController extends GetxController {
  final CartRepo cartRepo;
  CartController({required this.cartRepo});


  Map<int, CartModels> _item = {};

  Map<int, CartModels> get item => _item;
  /*
  only for Storage and sharepreferances
   */

  List<CartModels> storageItems=[];


  void addItem(ProductsModels products, int quantity) {
    var totalQuantity = 0;
    if (_item.containsKey(products.id! )) {
      _item.update(products.id!, (value) {
        totalQuantity=value.quantity!+quantity;
        return CartModels(
          id: value.id,
          name: value.name,
          price: value.price,
          img: value.img,
          quantity: value.quantity!+quantity,
          isExit: true,
          time: DateTime.now().toString(),
          product: products
        );
      });

      if(totalQuantity<=0){
        _item.remove(products.id);
      }
    } else {
      if(quantity>0){
        _item.putIfAbsent(products.id!, () {
          return CartModels(
            id: products.id,
            name: products.name,
            price: products.price,
            img: products.img,
            quantity: quantity,
            isExit: true,
            time: DateTime.now().toString(),
            product: products,
          );
        }
        );
      }else{
        Get.snackbar('Item count',"You should at least an item in the cart!",
                backgroundColor:  AppColor.mainColor,
                colorText: Colors.white,
         );
      }
    }
    cartRepo.addToCartList(getItem);
    update();
  }

   bool  existInCart(ProductsModels products){
    if(_item.containsKey(products.id)){
      return true;
    }
      return false;
  }

   int  getQuantity(ProductsModels products){
    var quantity = 0;
    if(_item.containsKey(products.id)){
      _item.forEach((key, value) {
        if(key==products.id){
          quantity = value.quantity!;
        }
      });
    }
    return quantity;
   }


   int get totalItem{
    var totalQuantity = 0;
    _item.forEach((key, value) {
      totalQuantity+=value.quantity!;
    });
    return totalQuantity;
   }

   List<CartModels> get getItem{
    return  _item.entries.map((e){
      return   e.value;
     }).toList();
   }

   int get totalAmount{
    var total = 0;
    _item.forEach((key, value) {
       total += value.quantity!*value.price!;
    });
    return total;
   }

  List<CartModels>  getCartData(){
    setCart= cartRepo.getCartList();
    return storageItems;
  }

  set setCart(List<CartModels> items){
    storageItems=items;
    print('the lenght of cart item is '+storageItems.length.toString());
    for(int i = 0; i<storageItems.length;i++){
      _item.putIfAbsent(storageItems[i].product!.id!, () => storageItems[i]);
    }
  }
  void addToHistory(){
    cartRepo.addToCartHistoryList();
    clear();
  }
  void clear(){
    _item={};
    update();
  }
}
