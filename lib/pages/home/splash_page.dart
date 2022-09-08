 import 'dart:async';

import 'package:delivery_app/routes/route_helper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../controllers/popular_product_cotroller.dart';
import '../../controllers/recommended_product_conroller.dart';

class SplashScreen extends StatefulWidget {
   const SplashScreen({Key? key}) : super(key: key);
 
   @override
   State<SplashScreen> createState() => _SplashScreenState();
 }
 
 class _SplashScreenState extends State<SplashScreen> with TickerProviderStateMixin{
  late Animation<double> animation;
  late AnimationController controller;
  Future<void> _loadResourace()async{
    await Get.find<PopularProductController>().getPopularProductList();
    await Get.find< RecommendedProductController>().getRecommendedProductList();
  }
  @override
  void initState() {
    _loadResourace();
    // TODO: implement initState
     controller = AnimationController(vsync: this, duration: const Duration(seconds: 2))..forward( );
     animation = CurvedAnimation(parent: controller, curve: Curves.linear);
     Timer(const Duration(
       seconds: 3
     ), ()=>Get.offNamed (RouteHelper.getInitial()));
  }

   @override
   Widget build(BuildContext context) {
     return Scaffold(
       body:  Column(
         mainAxisAlignment: MainAxisAlignment.center,
         children: [
         ScaleTransition(
             scale: animation ,
             child: Center(child: Image.asset('assets/3.png',))),
         Center(child: Image.asset('assets/thefood.png',)),
       ],),
     );
   }
 }
 