// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:delivery_app/Widgets/Big_text.dart';
import 'package:delivery_app/Widgets/show_more_text.dart';
import 'package:delivery_app/controllers/popular_product_cotroller.dart';
import 'package:delivery_app/controllers/recommended_product_conroller.dart';
import 'package:delivery_app/routes/route_helper.dart';
import 'package:delivery_app/utils/app_constant.dart';
import 'package:delivery_app/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

import '../../controllers/cart_controller.dart';
import 'cart_page.dart';

class RecommendedFoodDetail extends StatelessWidget {
  final int pageId;
  final String page;
  const RecommendedFoodDetail({Key? key, required this.pageId,required this.page})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var product =
        Get.find<RecommendedProductController>().recommendedProductList[pageId];
    Get.find<PopularProductController>()
        .getinit(product, Get.find<CartController>());
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: CustomScrollView(
          slivers: [
            SliverAppBar(
              automaticallyImplyLeading: false,
              toolbarHeight: 130,
              title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () {
                      if(page=="catPage") {
                        Get.toNamed(RouteHelper.getCartPage());
                      }else{
                        Get.toNamed(RouteHelper.getInitial());
                      }
                    },
                    child: CircleAvatar(
                        radius: 35,
                        backgroundColor: Colors.grey[300],
                        child: Icon(Icons.clear,color: Colors.black)),
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
                              child: Icon(Icons.shopping_cart_outlined,color: Colors.black,),
                              height: 70,
                              width: 70,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  shape: BoxShape.circle),
                            ),
                          ),
                        ),
                       controller.totalItem >= 1
                            ? Padding(
                                padding: const EdgeInsets.only(top: 50),
                                child: Stack(children: [
                                  Icon(Icons.circle,
                                      size: 35, color: AppColor.mainColor),
                                  Positioned(
                                      top: 6,
                                      left: 5,
                                      child: Text(
                                        Get.find<PopularProductController>()
                                            .totalItem
                                            .toString(),
                                        style: TextStyle(color: Colors.white),
                                      )),
                                ]),
                              )
                            : Padding(
                                padding:
                                    const EdgeInsets.only(bottom: 50, top: 50),
                                child: Container(),
                              ),
                      ],
                    );
                  }),
                ],
              ),
              bottom: PreferredSize(
                preferredSize: Size.fromHeight(0),
                child: Container(
                    margin: EdgeInsets.only(),
                    height: 67,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20)),
                    ),
                    child: Center(
                        child: Text(
                      product.name!,
                      style:
                          TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
                    ))),
              ),
              pinned: true,
              backgroundColor: AppColor.yellowColor,
              expandedHeight: 500,
              flexibleSpace: FlexibleSpaceBar(
                background: Image.asset(
                  // AppConstants.BASE_URL+AppConstants.UPLOAD_URL+product.img!,
                  'assets/1.jpeg',
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Container(
                color: Colors.white,
                margin: EdgeInsets.only(top: 20),
                child: Column(
                  children: [
                    Container(
                      color: Colors.white,
                      padding: EdgeInsets.only(left: 20, right: 20),
                      child: ShowMoreText(
                        text: product.description!,
                        fontSize: 20,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
        bottomNavigationBar: GetBuilder<PopularProductController>(
          builder: (controller) {
            return Column(mainAxisSize: MainAxisSize.min, children: [
              Container(
                color: Colors.white,
                child: Container(
                  color: Colors.white,
                  margin: EdgeInsets.only(left: 130, right: 130),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: () {
                          controller.setQuantity(false);
                        },
                        child: CircleAvatar(
                          backgroundColor: AppColor.mainColor,
                          radius: 40,
                          child: Icon(
                            Icons.remove,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      // Gap(40),
                      BigText(
                        text: '\$${product.price!}X ${controller.inCartItem}',
                        size: 50,
                      ),
                      // Gap(20),
                      GestureDetector(
                        onTap: () {
                          controller.setQuantity(true);
                        },
                        child: CircleAvatar(
                          backgroundColor: AppColor.mainColor,
                          radius: 40,
                          child: Icon(
                            Icons.add,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                height: 180,
                margin: EdgeInsets.only(top: 10.0),
                decoration: BoxDecoration(
                    color: Colors.grey[400],
                    borderRadius: BorderRadius.circular(30)),
                padding: EdgeInsets.all(40),
                child: Row(
                  children: [
                    Container(
                      height: 150,
                      width: 100,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(30)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.favorite,
                            color: AppColor.mainColor,
                            size: 50,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: 170,
                    ),
                    GestureDetector(
                      onTap: () {
                        controller.addItem(product);
                      },
                      child: Container(
                        height: 150,
                        width: 370,
                        decoration: BoxDecoration(
                            color: AppColor.mainColor,
                            borderRadius: BorderRadius.circular(30)),
                        child: Center(
                            child: Text(
                          '\$ ${product.price!} | Add Cart',
                          style: TextStyle(color: Colors.white, fontSize: 30),
                        )),
                      ),
                    ),
                  ],
                ),
              ),
            ]);
          },
        ),
      ),
    );
  }
}
