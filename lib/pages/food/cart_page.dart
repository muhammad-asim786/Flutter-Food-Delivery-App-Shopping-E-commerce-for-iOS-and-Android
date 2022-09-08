// ignore_for_file: prefer_const_constructors

import 'package:delivery_app/Widgets/Big_text.dart';
import 'package:delivery_app/Widgets/small_text.dart';
import 'package:delivery_app/controllers/cart_controller.dart';
import 'package:delivery_app/controllers/popular_product_cotroller.dart';
import 'package:delivery_app/routes/route_helper.dart';
import 'package:delivery_app/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controllers/recommended_product_conroller.dart';

class CartPage extends StatelessWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
              top: 20 * 3,
              left: 20,
              right: 20,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CircleAvatar(
                      radius: 30,
                      backgroundColor: AppColor.mainColor,
                      child: const Icon(Icons.arrow_back_ios,
                          size: 30, color: Colors.white)),
                  const SizedBox(
                    width: 50 * 5,
                  ),
                  GestureDetector(
                    onTap: () {
                      Get.toNamed(RouteHelper.getInitial());
                    },
                    child: CircleAvatar(
                        radius: 30,
                        backgroundColor: AppColor.mainColor,
                        child: const Icon(Icons.home_outlined,
                            size: 30, color: Colors.white)),
                  ),
                  CircleAvatar(
                      radius: 30,
                      backgroundColor: AppColor.mainColor,
                      child: const Icon(Icons.shopping_cart,
                          size: 30, color: Colors.white)),
                ],
              )),
          Container(
            margin: const EdgeInsets.only(top: 150, left: 25, right: 25),
            height: double.infinity,
            width: double.infinity,
            // color: Colors.red,
            child: MediaQuery.removePadding(
              context: context,
              removeTop: true,
              child: GetBuilder<CartController>(builder: (cartController){
                var _cartList = cartController.getItem;
                return ListView.builder(
                    itemCount: _cartList.length ,
                    itemBuilder: (_, index) {
                      return Container(
                        width: double.maxFinite,
                        height: 150,
                        child: Row(
                          children: [
                            GestureDetector(
                              onTap:(){
                                var popularIndex = Get.find<PopularProductController>()
                                    .popularProductList
                                    .indexOf(_cartList[index].product!);
                                if(popularIndex>=0){
                                  Get.toNamed(RouteHelper.getPopularFood(popularIndex,"cartPage"));
                                }else{
                                  var recommendedIndex = Get.find<RecommendedProductController>()
                                      .recommendedProductList
                                      .indexOf(_cartList[index].product!);
                                  Get.toNamed(RouteHelper.getRecommendedFood(recommendedIndex, "catPage"));
                                }
                              },
                              child: Container(
                                margin: const EdgeInsets.only(bottom: 20),
                                width: 180,
                                height: 180,
                                decoration: BoxDecoration(
                                    image: const DecorationImage(
                                        fit: BoxFit.cover,
                                        image: AssetImage(
                                        // AppConstants.BASE_URL+AppConstants.UPLOAD_URL+cartController.getItem[index].img!,
                                            'assets/2.jpeg'
                                        )),
                                    borderRadius: BorderRadius.circular(20),
                                    color: Colors.white),
                              ),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Expanded(
                                child: Container(
                                  height: 100,
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      BigText(
                                        text: cartController.getItem[index].name!,
                                        color: Colors.black54,
                                        size: 30,
                                      ),
                                      SmallText(
                                        text: 'Spicy',
                                        size: 20,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                        children: [
                                          SmallText(
                                            text: "\$ ${cartController.getItem[index].price}",
                                            color: Colors.redAccent,
                                            size: 30,
                                          ),
                                          Container(
                                            height: 40,
                                            width: 150,
                                            decoration: BoxDecoration(
                                                color: Colors.white,
                                                borderRadius:
                                                BorderRadius.circular(50)),
                                            child: Row(
                                              mainAxisAlignment:
                                              MainAxisAlignment.center,
                                              children: [
                                                GestureDetector(
                                                  onTap: () {
                                                    print('this is minus button');
                                                    cartController.addItem(_cartList[index].product!, -1);
                                                  },
                                                  child: const Icon(
                                                    Icons.remove,
                                                    size: 40,
                                                  ),
                                                ),
                                                const SizedBox(
                                                  width: 15,
                                                ),
                                                BigText(text: _cartList[index].quantity.toString(),size: 30 ,),
                                                const SizedBox(
                                                  width: 15,
                                                ),
                                                GestureDetector(
                                                  onTap: () {
                                                    cartController.addItem(_cartList[index].product!,1);
                                                    // popularProduct.setQuantity(true);
                                                  },
                                                  child: const Icon(
                                                    Icons.add,
                                                    size: 40,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ))
                          ],
                        ),
                      );
                    });
              },)
            ),
          ),
          GetBuilder<CartController>(builder: (cartController) {
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
                      height: 100,
                      width: 150,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(30)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            width: 5,
                          ),
                          SmallText(text: "\$ ${cartController.totalAmount}",size: 35,color: Colors.black,),
                          SizedBox(
                            width: 15,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: 220,
                    ),
                    GestureDetector(
                      onTap: () {
                        // popularProduct.addItem(product);
                        print('tapped');
                        cartController.addToHistory();
                      },
                      child: Container(
                        height: 150,
                        width: 250,
                        decoration: BoxDecoration(
                            color: AppColor.mainColor,
                            borderRadius: BorderRadius.circular(30)),
                        child: Center(
                            child: Text(
                              " Check out ",
                              style: TextStyle(color: Colors.white, fontSize: 30),
                            )),
                      ),
                    ),
                  ],
                ),
              ),
            );
          })
        ],
      ),

    );
  }
}
