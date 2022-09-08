import 'package:delivery_app/pages/home/home_page.dart';
import 'package:delivery_app/pages/home/main_food_page.dart';
import 'package:delivery_app/pages/home/splash_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';

import '../pages/food/cart_page.dart';
import '../pages/food/popular_food_detail.dart';
import '../pages/food/recomanded_food_detail.dart';

class RouteHelper{
  static const String splashScreen = "/splash-screen";
  static const String initial = "/";
  static const String popularFood = "/popular-food";
  static const String recommendedFood = "/recommended-food";
  static const String cartPage = "/catPage";

  static String getSplashScreen()=> "$splashScreen"; 
  static String getInitial()=> '$initial';
  static String getPopularFood(int pageId,String page )=> "$popularFood?pageId=$pageId&page=$page";
  static String getRecommendedFood(int pageId,String page)=> "$recommendedFood?pageId=$pageId&page=$page";
  static String getCartPage()=> '$cartPage';

  static List<GetPage> routes= [
    GetPage(name: splashScreen, page: ()=>SplashScreen()),
    GetPage(name: initial, page: ()=>HomePage()),
    GetPage(name: popularFood, page: (){
      var pageId = Get.parameters['pageId'];
      var page = Get.parameters['page'];
      return PupularFoodDestail(pageId: int.parse(pageId!),page:page!);
    },
    transition: Transition.fadeIn
    ),
    GetPage(name: recommendedFood, page: (){
      var pageId = Get.parameters['pageId'];
      var page = Get.parameters['page'];
      return RecommendedFoodDetail(pageId: int.parse(pageId!),page:page!);
    },
        transition: Transition.fadeIn
    ),
    GetPage(name: cartPage, page: (){
      return CartPage();
    },
        transition: Transition.fadeIn
    )
  ];
}