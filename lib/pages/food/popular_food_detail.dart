// ignore_for_file: sort_child_properties_last, prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:delivery_app/Widgets/small_text.dart';
import 'package:delivery_app/controllers/popular_product_cotroller.dart';
import 'package:delivery_app/routes/route_helper.dart';
import 'package:delivery_app/utils/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../Widgets/Big_text.dart';
import '../../Widgets/show_more_text.dart';
import '../../Widgets/icons_and_texts.dart';
import '../../controllers/cart_controller.dart';
import '../home/main_food_page.dart';
import 'cart_page.dart';

class PupularFoodDestail extends StatelessWidget {
 final int pageId;
 final String page;
  PupularFoodDestail({Key? key, required this.pageId,required this.page }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var product =
        Get.find<PopularProductController>().popularProductList[pageId];
    Get.find<PopularProductController>()
        .getinit(product, Get.find<CartController>());
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Stack(
          children: [
            Container(
              height: 500,
              width: double.infinity,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      fit: BoxFit.cover, image: AssetImage('assets/2.jpeg'))),
              child: Container(
                padding: EdgeInsets.only(left: 20, right: 20, bottom: 350),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () {
                        if(page=="cartPage") {
                          Get.toNamed(RouteHelper.getCartPage());
                        }else{
                          Get.toNamed(RouteHelper.getInitial());
                        }
                      },
                      child: Container(
                        child: Icon(Icons.arrow_back_ios_new),
                        height: 70,
                        width: 70,
                        decoration: BoxDecoration(
                            color: Colors.grey[350], shape: BoxShape.circle),
                      ),
                    ),
                    GetBuilder<PopularProductController>(builder: (controller) {
                      return Stack(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 40, bottom: 50),
                            child: GestureDetector(
                              onTap: () {
                                print('i am tabbing');
                                if(controller.totalItem>1)
                                Get.toNamed(RouteHelper.getCartPage());
                              },
                              child: Container(
                                child: Icon(Icons.shopping_cart_outlined),
                                height: 70,
                                width: 70,
                                decoration: BoxDecoration(
                                    color: Colors.grey[350],
                                    shape: BoxShape.circle),
                              ),
                            ),
                          ),
                          Get.find<PopularProductController>().totalItem >= 1
                              ? Padding(
                                  padding: const EdgeInsets.only(top: 50),
                                  child: Stack(children: [
                                    Icon(Icons.circle,
                                        size: 35,
                                        color: AppColor.mainColor),
                                    Positioned(
                                        top: 10,
                                        left: 13,
                                        child: Text(
                                          Get.find<PopularProductController>()
                                              .totalItem
                                              .toString(),
                                          style: TextStyle(color: Colors.white),
                                        )),
                                  ]),
                                )
                              : Padding(
                                  padding: const EdgeInsets.only(
                                      bottom: 50, top: 50),
                                  child: Container(),
                                ),
                        ],
                      );
                    }),
                  ],
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.all(15),
              margin: EdgeInsets.only(top: 450),
              height: 610,
              width: double.infinity,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30))),
              child: Container(
                padding: EdgeInsets.only(left: 20, right: 20, top: 40),
                child: Column(
                  // mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    BigText(
                      text: product.name!,
                      size: 36,
                      color: Colors.black,
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Row(
                      children: [
                        Wrap(
                            children: List.generate(
                                5,
                                (index) => Icon(
                                      Icons.star,
                                      color: AppColor.mainColor,
                                      size: 30,
                                    ))),
                        SizedBox(
                          width: 40,
                        ),
                        Text(
                          '4.2',
                          style: TextStyle(fontSize: 20),
                        ),
                        SizedBox(
                          width: 30,
                        ),
                        Text(
                          '1288',
                          style: TextStyle(fontSize: 20),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          'Commentes',
                          style: TextStyle(fontSize: 20),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Row(
                      children: [
                        IconsAndText(
                            text: 'Normal',
                            size: 50,
                            icon: Icons.circle,
                            iconsColor: AppColor.yellowColor),
                        SizedBox(
                          width: 110,
                        ),
                        IconsAndText(
                            text: '1.7Km',
                            size: 50,
                            icon: Icons.location_on,
                            iconsColor: AppColor.mainColor),
                        SizedBox(
                          width: 140,
                        ),
                        IconsAndText(
                            text: '23min',
                            size: 50,
                            icon: Icons.access_time_rounded,
                            iconsColor: AppColor.iconsColor2),
                      ],
                    ),
                    SizedBox(
                      height: 40,
                    ),
                    BigText(
                      text: 'Introduce',
                      size: 30,
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Expanded(
                      child: SingleChildScrollView(
                        scrollDirection: Axis.vertical,
                        child: ShowMoreText(
                          text: product.description!,
                          fontSize: 25,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            GetBuilder<PopularProductController>(builder: (popularProduct) {
              return Container(
                // padding: EdgeInsets.all(50),
                margin: EdgeInsets.only(
                  top: 1050,
                ),
                height: 200,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  color: Colors.grey[300],
                ),
                child: Container(
                  padding: EdgeInsets.all(50),
                  child: Row(
                    children: [
                      Container(
                        height: 150,
                        width: 200,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            GestureDetector(
                              onTap: () {
                                popularProduct.setQuantity(false);
                              },
                              child: Icon(
                                Icons.remove,
                                size: 40,
                              ),
                            ),
                            SizedBox(
                              width: 15,
                            ),
                            Text(
                              popularProduct.inCartItem.toString(),
                              style: TextStyle(
                                  fontSize: 40, fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              width: 15,
                            ),
                            GestureDetector(
                              onTap: () {
                                popularProduct.setQuantity(true);
                              },
                              child: Icon(
                                Icons.add,
                                size: 40,
                              ),
                            ),
                          ],
                        ),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(50)),
                      ),
                      SizedBox(
                        width: 50,
                      ),
                      GestureDetector(
                        onTap: () {
                          popularProduct.addItem(product);
                        },
                        child: Container(
                          height: 150,
                          width: 370,
                          child: Center(
                              child: Text(
                            "\$ ${product.price!} | " + "Add to Card ",
                            style: TextStyle(color: Colors.white, fontSize: 30),
                          )),
                          decoration: BoxDecoration(
                              color: AppColor.mainColor,
                              borderRadius: BorderRadius.circular(50)),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            }),
          ],
        ),
      ),
    );
  }
}
