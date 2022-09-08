// ignore_for_file: prefer_const_constructors

import 'package:delivery_app/controllers/cart_controller.dart';
import 'package:delivery_app/controllers/popular_product_cotroller.dart';
import 'package:delivery_app/pages/home/main_food_page.dart';
import 'package:delivery_app/pages/home/splash_page.dart';
import 'package:delivery_app/routes/route_helper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'controllers/recommended_product_conroller.dart';
import 'helper/dependecies.dart' as dep;


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dep.init();
  runApp( MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    Get.find<CartController>().getCartData();
    return GetBuilder<PopularProductController>(builder: (_){
      return GetBuilder<RecommendedProductController>(builder: (_){
       return GetMaterialApp(
         debugShowCheckedModeBanner: false,
         // home:SplashScreen(),
         initialRoute: RouteHelper.getSplashScreen(),
         getPages: RouteHelper.routes,
       );
      });
    });
  }
}
